class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerPull: andra28/pak:pvDiagram
baseCommand: ["/bin/bash" , "/diagram/script.sh"]



inputs:
    csv:
        type: File
        inputBinding: 
            position: 1
    gwe:
        type: File
        inputBinding:
            position: 2
outputs:
    csv:
        type: Directory
        outputBinding:
            glob: "_results/"
