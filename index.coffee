yaml = require 'js-yaml'
fs   = require 'fs'

module.exports =
  parse: (file) ->
    try
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
    catch e
      console.error  e
      steps: []
