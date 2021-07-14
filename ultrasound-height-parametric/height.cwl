class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerImageId: ultrasound:height
baseCommand: []

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing: 
      - entry: $(inputs.dicom)
      - entry: $(inputs.png)
        writable: True

inputs:
    systole-diastole:
        type: int
        inputBinding:
            position: 1
    dicom:
        type: File
        inputBinding:
            position: 2
            valueFrom: $(self.basename)
    png:
        type: File
        inputBinding:
            position: 3
            valueFrom: $(self.basename)
outputs:
    parametric:
        type: File[]
        outputBinding:
            glob: "input_parametric*"
    output:
        type: File
        outputBinding:
            glob: "output_Apical_view.txt"
