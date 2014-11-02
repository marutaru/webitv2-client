$ ->

  # load options
  $(document).ready () ->
    chrome.storage.local.get (val) ->
      console.log val["label"]
      $("input:radio[name='label']").val [val["label"]]

  # save options
  $("button").click (e) ->
    console.log $("input:radio[name='label']:checked").val()
    chrome.storage.local.set {"label":$("input:radio[name='label']:checked").val()}
