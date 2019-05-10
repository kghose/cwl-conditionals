class: Workflow
cwlVersion: v1.2
inputs:
  in1: File
  val: int

steps:
  stepA:
    in:
      in1: in1
    out: [out1]
    run: bypass-step.cwl
    run_if: $(inputs.val > 0)

  stepB:
    in:
      in1: in1
    out: [out1]
    run: bypass-step.cwl
    run_if: $(inputs.val > 1)

  stepC:
    in:
      in1: in1
    out: [out1]
    run: bypass-step.cwl
    run_if: $(inputs.val > 2)

outputs:
  out1: 
    type: File[]
    condMerge: ignore_skip  
    outputSource:
      - stepA/out1
      - stepB/out1
      - stepC/out1

requirements: 
  InlineJavascriptRequirement: {}