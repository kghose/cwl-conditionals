# CWL conditionals test bed

See common-workflow-language#854 for background and syntax

- Create a new virtual environment for testing
- Install CWL tool kaushik/conditionals/runif branch: git@github.com:common-workflow-language/cwltool.git@
- Install Toil from kaushik-work/toil  kaushik/conditionals/runif branch
- Checkout the test scripts and test files
- Run them with `cwltoil` 


```
pip install git+https://github.com/common-workflow-language/cwltool.git@kaushik/conditionals/runif
pip install git+https://github.com/kaushik-work/toil.git@kaushik/conditionals/runif
git clone https://github.com/kaushik-work/cwl-conditionals.git
cd cwl-conditionals

# Simple if-else
cwltoil bypass-wf.cwl job.1.yaml
cwltoil bypass-wf.cwl job.2.yaml


# One or more workflows in parallel depending on input value
cwltoil multi-wf.cwl job.1.yaml
cwltoil multi-wf.cwl job.2.yaml
cwltoil multi-wf.cwl job.3.yaml
```  

To discuss during 2019.05.14 community chat

- bypass-wf.cwl 
  - T/F condition. 
  - Show what happens with and without condMerge (Warnings)
- multi-wf.cwl
  - Show what happens with and without condMerge (Warnings)
  - Validation Error flagged when using `only_one`
- `SkipNull` mechanism
- Discuss special validation requirements for `only_one`
