# This scatters two conditional steps to show how conditionals
# and scatter work together

# cwltoil workflows/pattern2.cwl --val 4  # evens = foo, odds = bar


class: Workflow
cwlVersion: v1.2
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
    runIf: $(inputs.in1 % 2)
    out: [out1]
    
  step3:
    in:
      in1: step1/out1
    scatter: [in1]
    run: ../tools/bar.cwl
    runIf: $(1 - inputs.in1 % 2)
    out: [out1]

outputs: 
  out1:
    type: string[]
    outputSource:
      - step2/out1
      - step3/out1
    branchSelect: all_that_ran  # Omitting will give nulls
    linkMerge: merge_flattened  # Omitting will give validation error

requirements: 
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}