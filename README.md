# CWL conditionals test bed

See common-workflow-language/common-workflow-language#854 for background and syntax

- Create a new virtual environment for testing
- Install CWL tool `kaushik/conditionals/runif` branch
- Install Toil from `kaushik-work/toil`  `kaushik/conditionals/runif` branch
- Checkout the test scripts and test files
- Run them with `cwltoil` 


```
pip install git+https://github.com/common-workflow-language/cwltool.git@kaushik/conditionals/runif
pip install git+https://github.com/kaushik-work/toil.git@kaushik/conditionals/runif
git clone https://github.com/kaushik-work/cwl-conditionals.git
cd cwl-conditionals
```  

Now you can run the different patterns. Look at the following workflows
and the documentation in the code

```
workflows/pattern1-1.cwl
workflows/pattern1-2.cwl
workflows/pattern2.cwl
workflows/pattern3.cwl
workflows/pattern4.cwl
workflows/pattern5.cwl
workflows/scatter.cwl
```

To discuss during 2019.06.04 community chat
- What to do about expression inputs not present in the tool?
  - Right now we just add this to the step inputs section and get a validation
    warning
  - A mandatory separate input section for the expression would look ugly
    but we could have a supplemental section that declares just the additional 
    inputs

instead of:

```
  step1:
    in:
      in1: val
      a_new_var: val  # <-- don't put this here
    run: ../tools/foo.cwl
    runIf: $(inputs.a_new_var > 1)
    out: [out1]
```

We could do the slightly more verbose
```
  step1:
    in:
      in1: val
    run: ../tools/foo.cwl
    runIf:
      in:
        a_new_var: val
      expr: $(inputs.a_new_var > 1)
    out: [out1]
```
Here whatever is declared in the `in` field in `runIf` is merged into the
`inputs` field as available to the expression. Validations should flag any
duplication of variable names

I personally prefer the less verbose form - the poor writer has a lot to write
already

To discuss during 2019.05.14 community chat

- bypass-wf.cwl 
  - T/F condition. 
  - Show what happens with and without condMerge (Warnings)
- multi-wf.cwl
  - Show what happens with and without condMerge (Warnings)
  - Validation Error flagged when using `only_one`
- `SkipNull` mechanism
- Discuss special validation requirements for `only_one`
