
$ ->
  result = new Object
  $.ajax
    type: "GET"
    url: "https://api.instagram.com/v1/users/30699936/media/recent/?client_id=9d8a07f4fb66443dbb84f67f6d5e87fc"
  
    success: (result) ->
      result = $.parseJSON(result)
  
  console.log(result)
  false
