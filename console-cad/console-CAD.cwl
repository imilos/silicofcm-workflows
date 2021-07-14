class: CommandLineTool
cwlVersion: v1.0
baseCommand: []

requirements:
  - class: DockerRequirement
    dockerPull: andra28/cad:lv-parametric

inputs:
    input-file:
        type: File
        inputBinding:
            position: 1
outputs:
    dat:
        type: File
        outputBinding:
            glob: "output/pak.dat"
    vtk:
        type: File
        outputBinding:
            glob: "*.vtk"
