cwlVersion: v1.0
class: Workflow
inputs:
  input-file: File

outputs:
  vtk:
    type: 
        type: array
        items: File
    outputSource: pak/vtk
  avis:
    type: Directory
    outputSource: paraview/avis
steps:
  console-cad:
    run: console-CAD.cwl
    in:
      input-file: input-file
    out: [dat,solverVersion]

  pak:
    run: pak.cwl
    in:
      dat: console-cad/dat
      solverVersion: console-cad/solverVersion
    out: [vtk]
  paraview:
    run: paraview.cwl
    in:
      vtks: pak/vtk
    out: [avis]

