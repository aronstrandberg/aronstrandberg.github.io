$ ->
	$('.scroll-to-top').click ->
		console.log "clicky"
		$('html,body').animate
			scrollTop: 0
			400
		false
