Spine = require('spine')

class Columns extends Spine.Controller

  events:
    "dblclick h2"           : "edit"
    "blur input"            : "close"
    "click .column-destroy" : "remove"

  elements:
    "input[type=text]": "input"

  constructor: ->
    super
    @column.bind("update",  @render)
    @column.bind("destroy", @release)

  render: =>
    @replace require('views/column')(@column)
    @

  remove: ->
    @log "remove invoked"
    @column.destroy()

  edit: ->
    @el.addClass("editing")
    @input.focus()

  close: ->
    @el.removeClass("editing")
    @column.updateAttributes({title: @input.val()})


module.exports = Columns