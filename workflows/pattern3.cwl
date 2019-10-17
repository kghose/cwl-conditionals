# Pattern 3: Inefficient if-else

# cwltoil workflows/pattern3.cwl --val 0
# cwltoil workflows/pattern3.cwl --val 1  -> should NOT give any issues
# cwltoil workflows/pattern3.cwl --val 2

class: Workflow
cwlVersion: v1.2
inputs:
  val: int

steps:

  # We could have used inputs.in1 but we do this to illustrate
  # How we can use additional variables in the expression that
  # are not declared in the underlying tool

  step0:
    in:
      in1: val
      a_new_var: val
    run: ../tools/foo.cwl
    when: $(inputs.a_new_var > 1)
    out: [out1]


  step1:
    in:
      in1: val
      a_new_var: val
    run: ../tools/bar.cwl
    # when: $(inputs.a_new_var < 1)
    out: [out1]

outputs:
  out1: 
    type: string
    outputSource:
      first_that_ran:
        - step0/out1
        - step1/out1

requirements: 
  InlineJavascriptRequirement: {}
