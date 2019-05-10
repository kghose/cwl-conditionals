class: CommandLineTool
cwlVersion: v1.2
inputs:
  in1: 
    type: File
    inputBinding: {position: 1}

baseCommand: [cat]

outputs: 
  out1: stdout

stdout: out.txt