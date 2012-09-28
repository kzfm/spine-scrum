Spine = require('spine')

class Notes extends Spine.Controller
  events:
    "click .delete" : "remove"
    "dragstop"      : "updatePosition"
    "resize"        : "updateSize"
    "blur textarea" : "updateContent"

  constructor: ->
    super
    @note.bind("update",  @render)
    @note.bind("destroy", @release)

  render: =>
    el = @replace require('views/note')(@note)
    el.css(
      "width"   : @note.w
      "height"  : @note.h
      "left"    : @note.x
      "top"     : @note.y
      "opacity" : 0.9
    )
    el.draggable().resizable()
    @

  remove: ->
    @note.destroy()

  updateSize: (e, ui) ->
    #@note.updateAttributes
    #  w:ui.size.width
    #  h:ui.size.height
    console.log ui

  updatePosition: (e, ui) ->
    @note.updateAttributes
      y:ui.position.top
      x:ui.position.left

  updateContent: (e, ui) ->
    @note.updateAttributes({content:e.currentTarget.value})



module.exports = Notes