class: Workflow
cwlVersion: v1.2
inputs:
  in1: File
  val: int

steps:
  step1:
    in:
      in1: in1
    out: [out1]
    run: bypass-step.cwl
    run_if: $(inputs.val > 1)

outputs:
  out1: 
    type: File[]
    condMerge: first_non_skip  
    outputSource:
      - step1/out1
      - in1

requirements: 
  InlineJavascriptRequirement: {}