class: CommandLineTool
cwlVersion: v1.0
baseCommand: ["/bin/bash", "/slicing/script.sh", "/slicing/pak-fs-patient.txt"]

requirements:
  - class: DockerRequirement
    dockerPull: andra28/slicer

inputs:
    vtks:
        type: File
        inputBinding:
            position: 1
outputs:
    slices:
        type: File
        outputBinding:
            glob: "*-slice2.vtk"
