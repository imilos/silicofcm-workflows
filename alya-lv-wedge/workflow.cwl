cwlVersion: v1.0
class: Workflow

requirements:
  ScatterFeatureRequirement: {}

inputs:
    dat: File
    exm: File
    cpu: int
outputs:
  TThet_out: 
    type: File
    outputSource: alya/TThet_out
  post_files:
    type:
      type: array
      items: File
    outputSource: alya/post_files
  ensi:
    type:
      type: array
      items: File
    outputSource: alya/ensi
  exm_files:
    type:
      type: array
      items: File
    outputSource: alya/exm_files
  par_files:
    type:
      type: array
      items: File
    outputSource: alya/par_files
  dat_files:
    type:
      type: array
      items: File
    outputSource: alya/dat_files
  cvg_files:
    type:
      type: array
      items: File
    outputSource: alya/cvg_files
  log_files:
    type:
      type: array
      items: File
    outputSource: alya/log_files
  vtu: 
    type: Directory
    outputSource: paraview/vtu
  avi:
    type: Directory
    outputSource: paraview/avi
  csv:
    type: Directory
    outputSource: diagram/csv
steps:
  alya:
    run: alya.cwl
    in:
      dat: dat
      exm: exm
      cpu: cpu
    out: [ensi, post_files, exm_files, par_files, dat_files, cvg_files, log_files, res_files, TThet_out, vin]

  paraview:
    run: convert.cwl
    in:
      ensi: alya/ensi
    out: [vtu,avi]
  diagram:
    run: diagram.cwl
    in:
      vin: alya/vin
    out: [csv]
    
