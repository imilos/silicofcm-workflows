class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerPull: andra28/ultrasound:postprocess
baseCommand: ["/bin/bash", "/ultrasound_postprocess/script.sh"]


requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.m_mode)
      - $(inputs.csv)
      - $(inputs.apical)


inputs:

    m_mode:
        type: File
        inputBinding:
            position: 1
    apical:
        type: File
        inputBinding:
            position: 2
    csv:
        type: File
        inputBinding: 
            position: 3
outputs:
    newPv:
        type: Directory
        outputBinding:
            glob: "_results"
