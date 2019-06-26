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
workflows/pattern0-1.cwl
workflows/pattern0-2.cwl
workflows/pattern1-1.cwl
workflows/pattern1-2.cwl
workflows/pattern2.cwl
workflows/pattern3.cwl
workflows/pattern4.cwl
workflows/pattern5.cwl
workflows/scatter.cwl
```

## Useful links

1. [Design decision document](https://github.com/common-workflow-language/common-workflow-language/blob/kaushik-work-patch-1/design-decisions/conditionals-2019.md)
1. [Proposal](https://github.com/common-workflow-language/common-workflow-language/issues/854)
1. [Collected list of use cases](https://github.com/common-workflow-language/common-workflow-language/issues/725)
1. [List of proposals for conditionals](https://github.com/common-workflow-language/common-workflow-language/issues?utf8=%E2%9C%93&q=label%3Aconditionals+)