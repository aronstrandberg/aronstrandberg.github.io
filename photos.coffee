
$ ->
  # window.location = "https://instagram.com/oauth/authorize/?client_id=9d8a07f4fb66443dbb84f67f6d5e87fc&redirect_uri=http://aronstrandberg.com/photos/&response_type=token"
  result = new Object
  $.ajax
    type: "GET"
    url: "https://api.instagram.com/v1/users/30699936/media/recent/?access_token=30699936.9d8a07f.7a573e8a48bf47478f8d1f9fc5b01ce9?callback=callback"
    jsonp: "callback"
    dataType: "jsonp"
    success: (response) ->
      console.log "hej"
      console.log response
      result = $.parseJSON(response)
      console.log(result)
      false
  