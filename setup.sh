# Setup script

# Do this manually
# git clone https://github.com/kaushik-work/cwl-conditionals.git
# chmod +x ./cwl-conditionals/setup.sh
# ./cwl-conditionals/setup.sh

python3 -m venv ~/.venvs/conditionals
# virtualenv ~/.venvs/conditionals   # Python 2

. ~/.venvs/conditionals/bin/activate

git clone --branch kaushik/conditionals/when https://github.com/kaushik-work/toil.git
cd toil
pip install -e .[cwl]
cd ..

toil --version  # should read 3.21.0a1

# cwltool has to be installed from a clone. Not clear to me why
# has something to do with the schema not being properly installed I think
git clone --branch pa/conditionals https://github.com/common-workflow-language/cwltool.git
cd cwltool
pip install -e .
cd ..

cd cwl-conditionals
chmod +x run-examples.sh
./run-examples.sh