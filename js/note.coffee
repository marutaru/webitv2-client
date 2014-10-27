$ ->
  console.log "webitv2"
  $("body").dblclick (e) ->
    console.log "dblclick:"
    console.log e.target
    $(e.target).append "<span id='webit-note' class='label label-info'>webitv2</span>"
    .child().animate {"margin-left":"+=100px"},"slow"
