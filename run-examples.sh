set -e

cwltoil workflows/baseline.cwl --in1 A --in2 B

cwltoil --enable-dev workflows/pattern0-1.cwl --val 1
cwltoil --enable-dev workflows/pattern0-1.cwl --val 2

cwltoil --enable-dev workflows/pattern0-2.cwl --val 1
cwltoil --enable-dev workflows/pattern0-2.cwl --val 2

cwltoil --enable-dev workflows/pattern1-1.cwl --in1 "Direct" --val 1
cwltoil --enable-dev workflows/pattern1-1.cwl --in1 "Direct" --val 2

cwltoil --enable-dev workflows/pattern1-2.cwl --in1 "Direct" --val 1
cwltoil --enable-dev workflows/pattern1-2.cwl --in1 "Direct" --val 2

cwltoil --enable-dev workflows/pattern2.cwl --val 0
cwltoil --enable-dev workflows/pattern2.cwl --val 1  # --> raises exception
cwltoil --enable-dev workflows/pattern2.cwl --val 2

cwltoil --enable-dev workflows/pattern3.cwl --val 0
cwltoil --enable-dev workflows/pattern3.cwl --val 1  # --> should NOT give any issues
cwltoil --enable-dev workflows/pattern3.cwl --val 2

cwltoil --enable-dev workflows/pattern4.cwl --val 1  # Empty list
cwltoil --enable-dev workflows/pattern4.cwl --val 2  # One item
cwltoil --enable-dev workflows/pattern4.cwl --val 3  # two items

cwltoil --enable-dev workflows/pattern2.cwl --val 0  # bar
cwltoil --enable-dev workflows/pattern2.cwl --val 1  # Runtime error
cwltoil --enable-dev workflows/pattern2.cwl --val 2  # foo

cwltoil --enable-dev workflows/scatter-1.cwl --val 4  # just odd = foo
cwltoil --enable-dev workflows/scatter-2.cwl --val 4  # odd = foo, evens = bar