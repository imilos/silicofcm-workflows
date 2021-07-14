class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerPull: andra28/paraview:pak-ogv
baseCommand: ["/opt/paraview/bin/pvpython", "/paraview/multiple-patients.py"]

requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.vtks)

inputs:
    vtks:
        type: File[]
        inputBinding: 
            position: 1
outputs:
    avis:
        type: Directory
        outputBinding:
            glob: "_results/"
