# This scatters two conditional steps to show how conditionals
# and scatter work together

# toil-cwl-runner --enable-dev workflows/scatter-2.cwl --val 4  # odd = foo, evens = bar


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
    when: $((inputs.in1 % 2) == 1)
    out: [out1]

  step3:
    in:
      in1: step1/out1
    scatter: [in1]
    run: ../tools/bar.cwl
    when: $((inputs.in1 % 2) == 0)
    out: [out1]

outputs:
  out1:
    type: string[]
    outputSource:
        - step2/out1
        - step3/out1
    pickValue: all_non_null  # Omitting will give a warning
    linkMerge: merge_flattened  # Omitting will give validation error

requirements:
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}
