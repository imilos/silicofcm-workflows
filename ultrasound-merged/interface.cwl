class: CommandLineTool
cwlVersion: v1.0

hints:
  DockerRequirement:
    dockerPull: andra28/ultrasound:cad-interface
baseCommand: []

requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.apical)
      - $(inputs.mmode)
      - $(inputs.pressure)
      - $(inputs.velocity)
      - $(inputs.mesh)
inputs:
    apical:
        type: File
        inputBinding: 
            position: 1
            valueFrom: $(self.basename)
    mmode:
        type: File
        inputBinding:
            position: 2
            valueFrom: $(self.basename)
    pressure:
        type: File
        inputBinding:
            position: 3
            valueFrom: $(self.basename)
    velocity:
        type: File
        inputBinding:
            position: 4
            valueFrom: $(self.basename)
    mesh:
        type: File
        inputBinding:
            position: 5
            valueFrom: $(self.basename)
outputs:
    output:
        type: File
        outputBinding:
            glob: "inputSF-example1.txt"
