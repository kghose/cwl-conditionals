# This implements the bypass pattern
# on workflow steps 

# cwltoil workflows/pattern1-2.cwl --in1 "Direct" --val 1
# cwltoil workflows/pattern1-2.cwl --in1 "Direct" --val 2

class: Workflow
cwlVersion: v1.2
inputs:
  in1: string
  val: int

steps:

  step0:
    in:
      in1: val
    run: ../tools/echo-int.cwl
    out: [out1]

  step1:
    in:
      val: val
    run: ../tools/foo.cwl
    when: ${return inputs.val > 1}
    out: [out1]

  step2:
    in:
      in1: 
        source:
          first_that_ran:
            - step1/out1
            - in1

    run: ../tools/echo.cwl
    out: [out1]

outputs:
  out1: 
    type: string
    outputSource: step2/out1

requirements: 
  InlineJavascriptRequirement: {}