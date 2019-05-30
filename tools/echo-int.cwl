# A simple tool that just passes
# The int it recieves

# cwltoil tools/echo-int.cwl --in1 22

class: CommandLineTool
cwlVersion: v1.0
inputs: 
  in1: int
baseCommand: [echo]
outputs:
  out1:
    type: int
    outputBinding:
      outputEval: $(inputs.in1)
