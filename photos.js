// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    var result;
    result = new Object;
    return $.ajax({
      type: "GET",
      url: "https://api.instagram.com/v1/users/30699936/media/recent/?access_token=30699936.9d8a07f.7a573e8a48bf47478f8d1f9fc5b01ce9?callback=callback",
      jsonp: "callback",
      dataType: "jsonp",
      success: function(response) {
        console.log("hej");
        console.log(response);
        result = $.parseJSON(response);
        console.log(result);
        return false;
      }
    });
  });

}).call(this);
