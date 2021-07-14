cwlVersion: v1.0
class: Workflow


inputs:
    dicom-m_mode: File
    dicom-height: File
    png: File
    systole-diastole: int
    pressure: File
    velocity: File
    mesh: File

outputs:
  vtk:
    type: File[]
    outputSource: pak/vtk
  avis:
    type: Directory
    outputSource: paraview/avis
  diagrams:
    type: Directory
    outputSource: diagram/csvs
  height-out:
    type: File
    outputSource: height/output
  mmode-out:
    type: File
    outputSource: m_mode/output
  newPv:
    type: Directory
    outputSource: postprocess/newPv
steps:
  m_mode:
    run: m_mode.cwl
    in:
      dicom: dicom-m_mode
    out: [output]
  height:
    run: height.cwl
    in:
      systole-diastole: systole-diastole
      dicom: dicom-height
      png: png
    out: [output]
  
  interface:
    run: interface.cwl
    in:
      apical: height/output
      mmode: m_mode/output
      pressure: pressure
      velocity: velocity
      mesh: mesh
    out: [output]

  console-cad:
    run: console-CAD.cwl
    in:
      input-file: interface/output
    out: [dat, solverVersion]

  pak:
    run: pak.cwl
    in:
      dat: console-cad/dat
      solverVersion: console-cad/solverVersion
    out: [vtk, csv, gwe]
    
  paraview:
    run: paraview.cwl
    in:
      vtks: pak/vtk
    out: [avis]
  diagram:
    run: pvDiagram.cwl
    in:
      csv: pak/csv
      gwe: pak/gwe
    out: [csvs, pv]
  postprocess:
    run: postprocess.cwl
    in:
      csv: diagram/pv
      m_mode: m_mode/output
      apical: height/output
    out: [newPv]
