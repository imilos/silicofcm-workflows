class: CommandLineTool
cwlVersion: v1.0
baseCommand: ["/bin/bash", "/musico/script.sh"]

requirements:
  - class: DockerRequirement
    dockerImageId: musico:source

inputs:
    input-zip:
        type: File
        inputBinding:
            position: 1
    
outputs:
    res:
        type: File
        outputBinding:
            glob: musicoOut.zip