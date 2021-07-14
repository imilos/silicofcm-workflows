class: CommandLineTool
cwlVersion: v1.0
baseCommand: []

requirements:
  - class: DockerRequirement
    dockerPull: andra28/pak-fs:patient
  - class: InlineJavascriptRequirement
inputs:
    dat:
      type: File
      inputBinding:
        position: 1
    solverVersion:
      type: File
      inputBinding:
        position: 2
outputs:
    vtk:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.vtk"
