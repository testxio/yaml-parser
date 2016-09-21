yaml = require 'js-yaml'
fs   = require 'fs'
pkg  = require './package.json'

module.exports =
  parse: (file) ->
    doc = yaml.safeLoad(fs.readFileSync(file, 'utf8'))
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
      file: file
