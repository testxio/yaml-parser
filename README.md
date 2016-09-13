# Usage

In CoffeeScript:

``` CoffeeScript
testx = require 'testx'
yamlParser = require 'testx-yaml-parser'

describe 'Some page', ->
  it 'should work in a certain way', ->
    testx.runScript yamlParser.parse 'mytests/test.yaml'
```
