class: CommandLineTool
cwlVersion: v1.0
inputs:
  in1: 
    type: string[]
    default: ["Hey there"]

baseCommand: [echo]

outputs:
  out1:
    type: string
    outputBinding:
      outputEval: a_$(inputs.in1)_b
