$ ->
  socket = io.connect "http://localhost:3000"
  socket.emit "find recent","hoge"
  socket.on "send recent",(pages)->
    for page in pages
      $("body").append "<div><a href='#{page.uri}'>#{page.uri}</a></div>"
