# Setup script

virtualenv ~/.venvs/conditionals-playground
. ~/.venvs/conditionals-playground/bin/activate

git clone https://github.com/kaushik-work/toil.git
cd toil
git checkout kaushik/conditionals/when
pip install -e .[cwl]
cd ..

toil --version  # should read 3.21.0a1

# cwltool has to be installed from a clone. Not clear to me why
# has something to do with the schema not being properly installed I think
git clone https://github.com/common-workflow-language/cwltool.git
cd cwltool
git checkout pa/conditionals
pip install -e .
cd ..

git clone https://github.com/kaushik-work/cwl-conditionals.git
cd cwl-conditionals

chmod +x run-examples.sh
./run-examples.sh