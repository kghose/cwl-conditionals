# This takes in a single int as input and 
# returns an array of ints [0 ... N - 1]

class: CommandLineTool
cwlVersion: v1.0
inputs:
  in1: int

baseCommand: ["echo"]

outputs: 
  out1:
    type: int[]
    outputBinding:
      outputEval: |-
        ${
          var out = []
          for(var i = 0; i < inputs.in1; i++) {
            out.push(i)
          }
          return out
        }

requirements:
  InlineJavascriptRequirement: {}