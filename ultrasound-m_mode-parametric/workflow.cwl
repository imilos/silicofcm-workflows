cwlVersion: v1.0
class: Workflow

requirements: 
  ScatterFeatureRequirement: {}

inputs:
    dicom: File

outputs:
  stl:
    type: 
        type: array
        items: File
    outputSource: ventricles/stl
  m_mode_out: 
    type: File
    outputSource: m_mode/output

steps:
  m_mode:
    run: m_mode.cwl
    in:
      dicom: dicom
    out: [parametric, output]

  ventricles:
    run: ventricles.cwl
    scatter: inFile
    in:
      inFile: m_mode/parametric
    out: [stl]
    
