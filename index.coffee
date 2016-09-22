yaml = require 'js-yaml'
fs   = require 'fs'
pkg  = require './package.json'

module.exports =
  parseFile: (file) ->
    script = parse fs.readFileSync(file, 'utf8')
    script.meta.file = file
    script

  parse: parse = (content) ->
    doc = yaml.safeLoad content
    steps = for step, row in doc
      keyword = Object.keys(step)[0]
      [all, kwd, _ignore, comment] = keyword.match /^(.*?)(\[(.*)\])?$/
      name: kwd?.trim() or keyword
      meta:
        'Full name': keyword
        Comment: comment?.trim() or ''
        Row: row + 1
      arguments: step[keyword]

    steps: steps
    meta:
      parser: "#{pkg.name}@#{pkg.version}"
