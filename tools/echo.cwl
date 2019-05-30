# A simple tool that just passes on
# The string it recieves

# cwltoil tools/echo.cwl --in1 "Hello"

class: CommandLineTool
cwlVersion: v1.0
inputs: 
  in1: string
baseCommand: [echo]
outputs:
  out1:
    type: string
    outputBinding:
      outputEval: $(inputs.in1)
