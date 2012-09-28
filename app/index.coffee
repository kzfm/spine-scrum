require('lib/setup')

Spine = require('spine')
Column = require('models/column')
Columns = require('controllers/columns')
Note = require('models/note')
Notes = require('controllers/notes')

class App extends Spine.Controller
  events:
    "click #add-column": "createColumn"
    "click .addNote": "createNote"

  elements:
    "#columns": "columns"
    "#notes": "notes"

  constructor: ->
    super
    Column.bind("create",  @addOneColumn)
    Column.bind("refresh", @addAllColumns)
    Column.bind("change", @adjustSize)
    Note.bind("create",  @addOneNote)
    Note.bind("refresh", @addAllNotes)
    Column.fetch()
    Note.fetch()

  addOneColumn: (column) =>
    view = new Columns(column: column)
    @columns.append(view.render().el)
    @adjustSize()

  addAllColumns: =>
    Column.each(@addOneColumn)

  createColumn: (e) ->
    e.preventDefault()
    Column.create(title: "new")

  adjustSize: ->
    width =  $('body').width()
    length = $('.column').size()
    column_width = width / length

    $('.column').each (index) ->
      $(@).width(column_width)
      $(@).css('left', index * column_width)

  addOneNote: (note) =>
    view = new Notes(note: note)
    @notes.append(view.render().el)

  addAllNotes: =>
    Note.each(@addOneNote)

  createNote: (e) ->
    e.preventDefault()
    color = e.currentTarget.className.split(" ")[1]
    Note.create(color: color, content : 'click here to write', w: 100, h: 80, x: 50, y: 50)

module.exports = App
