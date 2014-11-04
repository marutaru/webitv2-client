$ ->

  # load options
  $(document).ready () ->
    chrome.storage.local.get (val) ->
      console.log val["label"]
      console.log val["override"]
      $("input:radio[name='label']").val [val["label"]]
      $("input:radio[name='override']").val [val["override"]]

  # save options
  $("button").click (e) ->
    console.log $("input:radio[name='label']:checked").val()
    chrome.storage.local.set {"label":$("input:radio[name='label']:checked").val()}
    chrome.storage.local.set {"override":$("input:radio[name='override']:checked").val()}
