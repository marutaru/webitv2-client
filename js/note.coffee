$ ->
  console.log "webitv2"
  $("body").dblclick (e) ->
    console.log "dblclick:"
    console.log e.target
    $(e.target).append "<span id='webit-note' class='label label-info'>webitv2</span>"
    .children(":last").css "position","relative"
    #.children(":last").css "-webkit-animation","webit 5s linear 2s infinite alternate"

  socket = io.connect "http://localhost:3000"
