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
  preprocess:
    run: preprocess.cwl
    in:
      input-file: input-file
    out: [dat]

  pak:
    run: solver.cwl
    in:
      dat: preprocess/dat
    out: [vtk]
  paraview:
    run: paraview.cwl
    in:
      vtks: pak/vtk
    out: [avis]
