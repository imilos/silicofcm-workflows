class: CommandLineTool
cwlVersion: v1.0
baseCommand: []

requirements:
  - class: DockerRequirement
    dockerPull: andra28/alya:diagram

inputs:
    vin:
        type: File
        inputBinding:
            position: 1
outputs:
    csv:
        type: Directory
        outputBinding:
            glob: "_results/"

