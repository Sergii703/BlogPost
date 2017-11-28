$ ->
  	$('.pagination').length && $('#posts').length
	$(window).scroll ->
		url = $('.pagination .next a').attr('href')
		if url && $(window).scrollTop() > $(document).height() - $(window).height() - 20
			$('.pagination').text('Upload articles...')
			$.getScript(url)
	$(window).scroll()