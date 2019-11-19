# This takes in a single int as input and
# returns an array of ints [0 ... N - 1]

class: ExpressionTool
cwlVersion: v1.0
inputs:
  in1: int
outputs:
  out1: int[]
expression: |
  ${
    var out = []
    for(var i = 0; i < inputs.in1; i++) {
      out.push(i)
    }
    return {out1: out};
  }

requirements:
  InlineJavascriptRequirement: {}
