# Pattern 4: Zero or more to run

# cwltoil workflows/pattern4.cwl --val 1  # Empty list
# cwltoil workflows/pattern4.cwl --val 2  # One item
# cwltoil workflows/pattern4.cwl --val 3  # two items

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
    runIf: $(inputs.a_new_var > 1)
    out: [out1]


  step1:
    in:
      in1: val
      a_new_var: val
    run: ../tools/bar.cwl
    runIf: $(inputs.a_new_var > 2)
    out: [out1]

outputs:
  out1: 
    type: string[]
    # type: string  # The singleton type will raise a validation error
    outputSource:
      - step0/out1
      - step1/out1
    branchSelect: all_that_ran

requirements: 
  InlineJavascriptRequirement: {}
