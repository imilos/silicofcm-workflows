class: CommandLineTool
cwlVersion: v1.0
baseCommand: []

requirements:
  - class: DockerRequirement
    dockerPull: andra28/ventricles:latest
  - class: InlineJavascriptRequirement
inputs:
    inFile:
        type: File
        inputBinding:
            position: 1
outputs:
    stl:
        type: File
        outputBinding:
            glob: output.stl
            outputEval: ${ self[0].basename = inputs.inFile.basename.split(".")[0]+".stl"; return self;}
