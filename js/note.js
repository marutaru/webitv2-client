// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    var socket;
    $("body").dblclick(function(e) {
      var note;
      console.log(e.target);
      console.log(":");
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
        uri: e.target.baseURI
      };
      if (e.which === 1) {
        console.log("left click");
        $("body").append("<span id='webit-note' class='label label-info'>info</span>").children(":last").css("position", "absolute").css("left", "" + e.pageX + "px").css("top", "" + e.pageY + "px");
        return socket.emit("send note", note);
      } else if (e.which === 3) {
        console.log("right click");
        $("body").append("<span id='webit-note' class='label label-danger'>info</span>").children(":last").css("position", "absolute").css("left", "" + e.pageX + "px").css("top", "" + e.pageY + "px");
        return socket.emit("send note", note);
      }
    });
    socket = io.connect("http://localhost:3000");
    socket.emit("find notes", location.href);
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
