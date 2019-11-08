# Setup script

virtualenv ~/.venvs/conditionals-playground
. ~/.venvs/conditionals-playground/bin/activate

pip install git+https://github.com/common-workflow-language/cwltool.git@pa/conditionals
pip install git+https://github.com/kaushik-work/toil.git@kaushik/conditionals/when toil[cwl]
git clone https://github.com/kaushik-work/cwl-conditionals.git
cd cwl-conditionals

chmod +x run-examples.sh
./run-examples.sh