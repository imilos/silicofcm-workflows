class: CommandLineTool
cwlVersion: v1.0
baseCommand: []

requirements:
  - class: DockerRequirement
    dockerImageId: mp-surrogate
inputs:
    params:
      type: File
      inputBinding:
        position: 1
    Ca:
      type: File
      inputBinding:
        position: 2
outputs:
    res:
        type:
            type: array
            items: File
        outputBinding:
            glob: "result.csv"
   