yaml = require 'js-yaml'
fs   = require 'fs'
pkg  = require './package.json'

String::startsWith ?= (s) -> @[...s.length] is s

findKeywordLines = (lines) ->
  line: i + 1 for line, i in lines when line.startsWith '- '

module.exports =
  parseFile: (file) ->
    script = parse fs.readFileSync(file, 'utf8')
    script.meta.file = file
    script

  parse: parse = (content) ->
    lines = findKeywordLines content.split '\n'
    doc = yaml.safeLoad content
    steps = for step, row in doc
      keyword = Object.keys(step)[0]
      [all, kwd, _ignore, comment] = keyword.match /^(.*?)(\[(.*)\])?$/
      name: kwd?.trim() or keyword
      meta:
        'Full name': keyword
        Comment: comment?.trim() or ''
        Row: lines[row]?.line or row
      arguments: step[keyword]

    steps: steps
    meta:
      parser: "#{pkg.name}@#{pkg.version}"
