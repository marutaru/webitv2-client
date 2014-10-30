$ ->
  socket = io.connect "http://localhost:3000"
  socket.emit "find recent","hoge"
  socket.on "send recent",(pages)->
    for page in pages
      $("body").append "<div></div>"
      .children(":last").append "<a href='#{page.uri}'>#{page.uri}</a>"
      .append "<span class='label label-info'>info</span>"
    $("a").click (e) ->
      console.log e
      console.log e.target
      chrome.tabs.create({"url":"#{e.target.href}","selected":true})
