class: CommandLineTool
cwlVersion: v1.0
baseCommand: []

requirements:
  - class: DockerRequirement
    dockerImageId: alya:S1S2

inputs:
    dat:
        type: File
        inputBinding:
            position: 1
    exm:
        type: File
        inputBinding:
            position: 2
    cpu:
        type: int
        inputBinding:
            position: 3
outputs:
    ensi:
        type: File[]
        outputBinding:
            glob: "*.ensi.*"
    post_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.post.*"
    exm_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.exm.*"
    par_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.par.*"
    dat_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.dat"
    log_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.log"
    cvg_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.cvg"
    res_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: "*.res"
    TThet_out:
        type: File
        outputBinding:
            glob: TThet_framework.txt
    vin:
        type: File
        outputBinding:
            glob: S1S2.exm.vin
