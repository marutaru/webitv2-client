// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    var label, socket;
    label = "info";
    socket = io.connect("http://marutaru.com:3000");
    $(document).ready(function() {
      socket.emit("find notes", location.href);
      return chrome.storage.local.get(function(val) {
        console.log(val["label"]);
        return label = val["label"];
      });
    });
    $("body").dblclick(function(e) {
      var note;
      console.log(e);
      note = {
        time: e.timeStamp,
        screenX: e.screenX,
        screenY: e.screenY,
        pageX: e.pageX,
        pageY: e.pageY,
        clientX: e.clientX,
        clientY: e.clientY,
        offsetX: e.offsetX,
        offsetY: e.offsetY,
        uri: e.target.baseURI,
        label: label,
        id: e.target.id ? e.target.id : void 0
      };
      if (e.which === 1) {
        console.log("left dblclick");
        $("body").append("<span id='webit-note' class='label label-" + label + "'>" + label + "</span>").children(":last").css("position", "absolute").css("left", "" + e.pageX + "px").css("top", "" + e.pageY + "px");
        return socket.emit("send note", note);
      }

      /*
      else if e.which is 3
        console.log "right dblclick"
        $("body").append "<span id='webit-note' class='label label-danger'>info</span>"
        .children(":last").css "position","absolute"
        .css "left","#{e.pageX}px"
        .css "top","#{e.pageY}px"
        socket.emit "send note",note
       */
    });
    return socket.on("send notes", function(notes) {
      var value, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = notes.length; _i < _len; _i++) {
        value = notes[_i];
        _results.push($("body").append("<span id='webit-note' class='label label-info'>info</span>").children(":last").css("position", "absolute").css("left", "" + value.pageX + "px").css("top", "" + value.pageY + "px"));
      }
      return _results;
    });
  });

}).call(this);
