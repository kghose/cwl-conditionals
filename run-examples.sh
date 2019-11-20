set -x

toil-cwl-runner workflows/baseline.cwl --in1 A --in2 B

toil-cwl-runner --enable-dev workflows/pattern0-1.cwl --val 1
toil-cwl-runner --enable-dev workflows/pattern0-1.cwl --val 2

toil-cwl-runner --enable-dev workflows/pattern0-2.cwl --val 1
toil-cwl-runner --enable-dev workflows/pattern0-2.cwl --val 2

toil-cwl-runner --enable-dev workflows/pattern1-1.cwl --in1 "Direct" --val 1
toil-cwl-runner --enable-dev workflows/pattern1-1.cwl --in1 "Direct" --val 2

toil-cwl-runner --enable-dev workflows/pattern1-2.cwl --in1 "Direct" --val 1
toil-cwl-runner --enable-dev workflows/pattern1-2.cwl --in1 "Direct" --val 2

toil-cwl-runner --enable-dev workflows/pattern2.cwl --val 0
toil-cwl-runner --enable-dev workflows/pattern2.cwl --val 1 || true # --> raises exception
toil-cwl-runner --enable-dev workflows/pattern2.cwl --val 2

toil-cwl-runner --enable-dev workflows/pattern3.cwl --val 0
toil-cwl-runner --enable-dev workflows/pattern3.cwl --val 1  # --> should NOT give any issues
toil-cwl-runner --enable-dev workflows/pattern3.cwl --val 2

toil-cwl-runner --enable-dev workflows/pattern4.cwl --val 1  # Empty list
toil-cwl-runner --enable-dev workflows/pattern4.cwl --val 2  # One item
toil-cwl-runner --enable-dev workflows/pattern4.cwl --val 3  # two items

toil-cwl-runner --enable-dev workflows/pattern2.cwl --val 0  # bar
toil-cwl-runner --enable-dev workflows/pattern2.cwl --val 1  || true # Runtime error
toil-cwl-runner --enable-dev workflows/pattern2.cwl --val 2  # foo

toil-cwl-runner --enable-dev workflows/scatter-1.cwl --val 4  # just odd = foo
toil-cwl-runner --enable-dev workflows/scatter-2.cwl --val 4  # odd = foo, evens = bar
toil-cwl-runner --enable-dev workflows/scatter-3.cwl --val 4  # odd = foo, evens = bar
