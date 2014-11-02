$ ->
  socket = io.connect "http://marutaru.com:3000"
  socket.emit "find recent","hoge"
  socket.on "send recent",(pages)->
    for page in pages
      $("body").append "<div id='webitv2-page'></div>"
      .children(":last").append "<a href='#{page.uri}'>#{page.uri}</a>"
      .append "<span class='label label-#{page.label}'>#{page.label}</span>"
      .click (e) ->
        chrome.tabs.create({"url":"#{e.target.href}","selected":true})
