// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    var label, override, socket;
    label = "info";
    override = "true";
    socket = io.connect("http://marutaru.com:3000");
    $(document).ready(function() {
      return chrome.storage.local.get(function(val) {
        label = val["label"];
        override = val["override"];
        if (override === "true") {
          return socket.emit("find notes", location.href);
        }
      });
    });
    $("body").dblclick(function(e) {
      console.log(e);
      return chrome.storage.local.get(function(val) {
        var note;
        console.log(val["label"]);
        label = val["label"];
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
          id: e.target.id ? e.target.id : void 0,
          title: document.title
        };
        console.log("left dblclick");
        socket.emit("send note", note);
        if (override === "true") {
          return $("body").append("<span id='webit-note' class='label label-" + label + "'>" + label + "</span>").children(":last").css("position", "absolute").css("left", "" + e.pageX + "px").css("top", "" + e.pageY + "px");
        }
      });
    });
    return socket.on("send notes", function(notes) {
      var value, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = notes.length; _i < _len; _i++) {
        value = notes[_i];
        _results.push($("body").append("<span id='webit-note' class='label label-" + value.label + "'>" + value.label + "</span>").children(":last").css("position", "absolute").css("left", "" + value.pageX + "px").css("top", "" + value.pageY + "px").css("z-index", "9999"));
      }
      return _results;
    });
  });

}).call(this);
