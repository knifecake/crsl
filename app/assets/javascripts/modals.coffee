$(document).on "turbolinks:load", ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    html = """
           <div class="modal" id="confirmationDialog">
             <div class="modal-dialog">
               <div class="modal-content">
                 <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                   <h4 class="modal-title"><i class="fa fa-question-circle"></i> #{message}</h4>
                 </div>
                 <div class="modal-footer">
                   <a data-dismiss="modal" class="btn btn-default">Cancel</a>
                   <a data-dismiss="modal" class="btn btn-danger confirm">Confirm</a>
                 </div>
               </div>
             </div>
           </div>
           """

    $(html).modal()

    $(document).keydown (e) ->
      if e.which == 13
        $('#confirmationDialog .confirm').click()

    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
