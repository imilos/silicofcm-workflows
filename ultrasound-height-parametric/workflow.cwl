cwlVersion: v1.0
class: Workflow

requirements: 
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
    systole-diastole: int
    dicom: File
    png: File

outputs:
  stl:
    type: 
        type: array
        items: File
    outputSource: ventricles/stl
  height_out: 
    type: File
    outputSource: height/output

steps:
  height:
    run: height.cwl
    in:
      systole-diastole: systole-diastole
      dicom: dicom
      png: png
    out: [parametric, output]

  ventricles:
    run: ventricles.cwl
    scatter: inFile
    in:
      inFile: height/parametric
    out: [stl]
    
