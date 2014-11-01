$ ->
  $("body").dblclick (e) ->
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
      id:e.target.id if e.target.id
    if e.which is 1
      console.log "left dblclick"
      $("body").append "<span id='webit-note' class='label label-info'>info</span>"
      .children(":last").css "position","absolute"
      .css "left","#{e.pageX}px"
      .css "top","#{e.pageY}px"
      socket.emit "send note",note
    else if e.which is 3
      console.log "right dblclick"
      $("body").append "<span id='webit-note' class='label label-danger'>info</span>"
      .children(":last").css "position","absolute"
      .css "left","#{e.pageX}px"
      .css "top","#{e.pageY}px"
      socket.emit "send note",note


  socket = io.connect "http://localhost:3000"
  socket.emit "find notes",location.href
  socket.on "send notes",(notes)->
    for value in notes
      $("body").append "<span id='webit-note' class='label label-info'>info</span>"
      .children(":last").css "position","absolute"
      .css "left","#{value.pageX}px"
      .css "top","#{value.pageY}px"
