# Setup script

# Do this manually
# git clone https://github.com/kaushik-work/cwl-conditionals.git
# chmod +x ./cwl-conditionals/setup.sh
# ./cwl-conditionals/setup.sh

CONDIENV=conditionals-env

python3 -m venv ${CONDIENV}
# virtualenv ${CONDIENV}   # Python 2

. ${CONDIENV}/bin/activate

# If toil is not installed from clone, it complains about missing galaxy libs
git clone --branch kaushik/conditionals/when https://github.com/kaushik-work/toil.git
cd toil
pip install -e .[cwl]
cd ..

toil --version  # should read 3.21.0a1

git clone --branch pa/conditionals https://github.com/common-workflow-language/cwltool.git
cd cwltool
pip install -e .
cd ..

cd cwl-conditionals
chmod +x run-examples.sh
./run-examples.sh