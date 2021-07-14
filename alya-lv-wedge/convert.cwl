class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerPull: andra28/paraview:ogv
baseCommand: ["/opt/paraview/bin/pvpython", "/paraview/main.py"]

requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.ensi)

inputs:
    ensi:
        type: File[]
        inputBinding:
            position: 1
outputs:
    vtu:
        type: Directory
        outputBinding:
            glob: "vtk/"
    avi:
        type: Directory
        outputBinding:
            glob: "_results/"

