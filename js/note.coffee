$ ->
  console.log "webitv2"
  $("body").dblclick (e) ->
    console.log "dblclick:"
    console.log e.target
    console.log ":"
    console.log e
    note =
      time:e.timeStamp
      screenX:e.screenX
      screenY:e.screenY
      pageX:e.pageX
      pageY:e.pageY
      clientX:e.clientX
      clientY:e.clientY
      offsetX:e.offsetX
      offsetY:e.offsetY
      uri:e.target.baseURI
    $("body").append "<span id='webit-note' class='label label-info'>webitv2</span>"
    .children(":last").css "position","absolute"
    .css "left","#{e.pageX}px"
    .css "top","#{e.pageY}px"
    socket.emit "send note",note
    #.children(":last").css "-webkit-animation","webit 5s linear 2s infinite alternate"

  socket = io.connect "http://localhost:3000"
