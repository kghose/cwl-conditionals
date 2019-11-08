# This implements the bypass pattern
# Directly on workflow I/O ports 

# cwltoil --enable-dev workflows/pattern1-1.cwl --in1 "Direct" --val 1
# cwltoil --enable-dev workflows/pattern1-1.cwl --in1 "Direct" --val 2

class: Workflow
cwlVersion: v1.2.0-dev1
inputs:
  in1: string
  val: int

steps:

  step1:
    in:
      in1: val
      a_new_var: in1
    run: ../tools/foo.cwl
    when: $(inputs.a_new_var > 1)
    out: [out1]
    # We could have used inputs.in1 but we do this to illustrate
    # How we can use additional variables in the expression that
    # are not declared in the underlying tool

outputs:
  out1: 
    type: string
    outputSource:
        - step1/out1
        - in1
    pickValue: first_non_null   # Should raise validation error if omitted

requirements: 
  InlineJavascriptRequirement: {}
