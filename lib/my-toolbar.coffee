buttons = require './buttons.json'
shell = require 'shell'

module.exports =
  urlholder: ''
  activate: (state) ->
    atom.packages.activatePackage('toolbar')
      .then (pkg) =>

        @toolbar = pkg.mainModule

        console.log buttons
        for btn in buttons
          switch btn.type
            when 'button'
              @toolbar.appendButton btn.icon, btn.callback, btn.tooltip, btn.iconset
            when 'spacer'
              @toolbar.appendSpacer()
            when 'url'
              @urlholder = btn.url
              @toolbar.appendButton btn.icon, =>
                shell.openExternal(@urlholder)
              , btn.tooltip, btn.iconset

  openLink: (link) ->
    console.log link

  deactivate: ->

  serialize: ->

