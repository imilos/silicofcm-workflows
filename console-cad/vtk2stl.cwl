class: CommandLineTool
cwlVersion: v1.0
baseCommand: ["python3", "/paraview/vtkToSTL.py"]

requirements:
  - class: DockerRequirement
    dockerPull: andra28/vtk2stl
inputs:
    vtk:
        type: File
        inputBinding:
            position: 1
outputs:
    stl:
        type: File
        outputBinding:
            glob: "*.stl"
