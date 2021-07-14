class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerImageId: ultrasound:m_mode
baseCommand: []

requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.dicom)

inputs:
    dicom:
        type: File
        inputBinding:
            position: 1
            valueFrom: $(self.basename)
outputs:
    parametric:
        type:
            type: array
            items: File
        outputBinding:
            glob: "input_parametric*"
    output:
        type: File
        outputBinding:
            glob: "output_M_mode.txt"
