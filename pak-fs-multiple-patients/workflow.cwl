cwlVersion: v1.0
class: Workflow

inputs:
  patientId: int

outputs:
  vtk:
    type: 
        type: array
        items: File
    outputSource: pak/vtk
  videos:
    type: Directory
    outputSource: video/avis

steps:
  console-cad:
    run: cad.cwl
    in:
      patientId: patientId
    out: [dat, solverVersion]

  pak:
    run: pak.cwl
    in:
      dat: console-cad/dat
      solverVersion: console-cad/solverVersion
    out: [vtk]
  video:
    run: paraview.cwl
    in:
      vtks: pak/vtk
    out: [avis]
