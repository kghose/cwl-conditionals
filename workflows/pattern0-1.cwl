# This implements the direct link pattern. The validator
# Will pass this since the output is optional

# cwltoil --enable-dev workflows/pattern0-1.cwl --val 1
# cwltoil --enable-dev workflows/pattern0-1.cwl --val 2

class: Workflow
cwlVersion: v1.2.0-dev1
inputs:
  val: int

steps:

  step1:
    in:
      in1: val
      a_new_var: val
    run: ../tools/foo.cwl
    when: $(inputs.a_new_var > 1)
    out: [out1]
    # We could have used inputs.in1 but we do this to illustrate
    # How we can use additional variables in the expression that
    # are not declared in the underlying tool

outputs:
  out1: 
    type: string?
    outputSource: step1/out1

requirements: 
  InlineJavascriptRequirement: {}
