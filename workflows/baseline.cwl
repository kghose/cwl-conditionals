# A regular workflow with no conditionals
# cwltoil workflows/baseline.cwl --in1 A --in2 B

class: Workflow
cwlVersion: v1.0
inputs:
  in1: string
  in2: string

steps:

  step1:
    in:
      in1: [in1, in2]
    run: ../tools/list-in.cwl
    out: [out1]

outputs:
  out1: 
    type: string[]
    outputSource:
        - step1/out1
        - in1

requirements: 
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}