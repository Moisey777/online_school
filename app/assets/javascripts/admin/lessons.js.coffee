jQuery ->
  new Lessons()

class Lessons
  constructor: ->
    @init_sortable()

  init_sortable: =>
    $('lessons_sotable').sortable
      axis: 'y'
      handle: '.handle'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))