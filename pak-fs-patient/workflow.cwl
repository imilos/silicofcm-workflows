cwlVersion: v1.0
class: Workflow

requirements:
  ScatterFeatureRequirement: {}

inputs:
  input-file: File

outputs:
  vtk:
    type: 
        type: array
        items: File
    outputSource: slicer/slices
steps:
  preprocess:
    run: preprocess.cwl
    in:
      input-file: input-file
    out: [dat,solverVersion]

  pak:
    run: pak.cwl
    in:
      dat: preprocess/dat
      solverVersion: preprocess/solverVersion
    out: [vtk]
  slicer:
    run: slicing.cwl
    scatter: vtks
    in:
      vtks: pak/vtk
    out: [slices]
