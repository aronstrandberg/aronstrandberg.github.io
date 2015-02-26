$ ->
  # window.location = "https://instagram.com/oauth/authorize/?client_id=9d8a07f4fb66443dbb84f67f6d5e87fc&redirect_uri=http://aronstrandberg.com/photos/&response_type=token"
  next = "https://api.instagram.com/v1/users/30699936/media/recent/?access_token=30699936.9d8a07f.7a573e8a48bf47478f8d1f9fc5b01ce9&callback=callback&count=32"
  ajax = (url) ->
    $.ajax
      type: "GET"
      url: url
      jsonp: "callback"
      dataType: "jsonp"
      success: (response) ->
        html = ""
        url = ""
        for img in response["data"]
          url = img["images"]["standard_resolution"]["url"]
          html += "<img src='#{url}'>"
          html += "<p class='caption'>#{img["caption"]["text"]}</p>"
          html += "<p class='likes'>#{img["likes"]["count"]}</p>"
        $('#photos').append(html)
        next = response["pagination"]["next_url"]
        console.log response["pagination"]["next_max_id"]
        console.log next
        # next
      complete: ->
        ajax(next)
        # ajax(response["pagination"]["next_url"])

  # i = 0
  # while i < 5
  #   newurl = ajax(next)
  #   ajax(newurl)
  #   i++
  ajax(next)
