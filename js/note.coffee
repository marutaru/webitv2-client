$ ->

  # init
  label = "info"
  socket = io.connect "http://marutaru.com:3000"
  $(document).ready () ->
    socket.emit "find notes",location.href
    chrome.storage.local.get (val) ->
      label = val["label"]

  # note
  $("body").dblclick (e) ->
    console.log e
    chrome.storage.local.get (val) ->
      console.log val["label"]
      label = val["label"]
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
        label:label
        id:e.target.id if e.target.id
      console.log "left dblclick"
      $("body").append "<span id='webit-note' class='label label-#{label}'>#{label}</span>"
      .children(":last").css "position","absolute"
      .css "left","#{e.pageX}px"
      .css "top","#{e.pageY}px"
      socket.emit "send note",note

  # receive notes
  socket.on "send notes",(notes)->
    for value in notes
      $("body").append "<span id='webit-note' class='label label-#{value.label}'>#{value.label}</span>"
      .children(":last").css "position","absolute"
      .css "left","#{value.pageX}px"
      .css "top","#{value.pageY}px"
