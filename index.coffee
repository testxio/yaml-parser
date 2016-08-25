yaml = require 'js-yaml'
fs   = require 'fs'



try
  doc = yaml.safeLoad(fs.readFileSync('test/test.yaml', 'utf8'))
  console.log doc

  steps = for k, v of doc
    name: k
    meta:
      'Full name': k
      Comment: 'get comment here'
    arguments: v

  console.dir {steps: steps},
    depth: 5
    color: true
catch e
  console.log e
