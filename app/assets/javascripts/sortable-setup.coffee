$(document).on "turbolinks:load", ->
  save_order = (sortable) ->
    $('#ordering').val(sortable.toArray().join(','))

  Sortable.create($('#poster-previews')[0], {
    store: {
      set: save_order
    }
  })
