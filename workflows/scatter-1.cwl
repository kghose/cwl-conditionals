# This scatters a conditional step. The pickValue will remove all the nulls

# cwltoil --enable-dev workflows/scatter-1.cwl --val 4  # only odd


class: Workflow
cwlVersion: v1.2.0-dev1
inputs:
  val: int

steps: 

  step1:
    in:
      in1: val
    run: ../tools/listify.cwl
    out: [out1]

  step2:
    in:
      in1: step1/out1
    scatter: [in1]
    run: ../tools/foo.cwl
    when: $(inputs.in1 % 2)
    out: [out1]
    
outputs: 
  out1:
    type: string[]
    outputSource: step2/out1
    pickValue: all_non_null

requirements: 
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}
