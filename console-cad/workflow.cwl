cwlVersion: v1.0
class: Workflow
inputs:
  input-file: File

outputs:
  vtk: 
    type: File
    outputSource: console-cad/vtk
  dat: 
    type: File
    outputSource: console-cad/dat
  stl: 
    type: File
    outputSource: vtk2stl/stl

steps:
  console-cad:
    run: console-CAD.cwl
    in:
      input-file: input-file
    out: [dat, vtk]

  vtk2stl:
    run: vtk2stl.cwl
    in:
      vtk: console-cad/vtk
    out: [stl]