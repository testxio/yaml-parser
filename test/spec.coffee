parser = require '..'
assert = require 'assert'

expected =
  steps: [
     name: 'step 1',
     meta:
       'Full name': 'step 1 [with comment]'
       Comment: 'with comment'
     arguments:
       'arg 11': 'val 1'
       'arg 12': 'val 2'
  ,
     name: 'step 2',
     meta:
       'Full name': 'step 2'
       Comment: ''
     arguments:
       'arg 21': 'val 111'
       'arg 22': 'multi\nline\nstring'
  ,
     name: 'step 3'
     meta:
       'Full name': 'step 3'
       Comment: ''
     arguments:
       'arg 3': 'ooooo'
  ]

script = parser.parse 'test/test.yaml'
# console.dir script,
#   depth: 5
assert.deepEqual script, expected
