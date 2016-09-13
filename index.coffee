yaml = require 'js-yaml'
fs   = require 'fs'
pkg  = require './package.json'

module.exports =
  parse: (file) ->
    doc = yaml.safeLoad(fs.readFileSync(file, 'utf8'))
    steps = for k, v of doc
      keyword = k.trim()
      [all, kwd, _ignore, comment] = keyword.match /^(.*?)(\[(.*)\])?$/
      name: kwd?.trim() or keyword
      meta:
        'Full name': keyword
        Comment: comment?.trim() or ''
      arguments: v

    steps: steps
    meta:
      parser: "#{pkg.name}@#{pkg.version}"
      file: file
