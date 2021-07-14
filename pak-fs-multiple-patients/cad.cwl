class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerPull: andra28/cad-multiple-patients
baseCommand: ["bash", "/pak/script.sh"]

inputs:
    patientId:
        type: int
        inputBinding: 
            position: 1
outputs:
    dat:
        type: File
        outputBinding:
            glob: "output/pak.dat"
    solverVersion:
        type: File
        outputBinding:
            glob: "solver_version.txt"
