parser = require '..'
assert = require 'assert'
pkg  = require '../package.json'

expected =
  meta:
    parser: "#{pkg.name}@#{pkg.version}",
    file: 'test/test.yaml'
  steps: [
     name: 'go to',
     meta:
       Row: 1
       'Full name': 'go to [with comment]'
       Comment: 'with comment'
     arguments:
       'arg 11': 'val 1'
       'arg 12': 'val 2'
  ,
     name: 'set',
     meta:
       Row: 2
       'Full name': 'set'
       Comment: ''
     arguments:
       'arg 21': 'val 111'
       'arg 22': 'multi\nline\nstring'
  ,
     name: 'set'
     meta:
       Row: 3
       'Full name': 'set'
       Comment: ''
     arguments:
       'arg 3': 'ooooo'
  ]

script = parser.parse 'test/test.yaml'
console.dir script,
  depth: 5
assert.deepEqual script, expected
