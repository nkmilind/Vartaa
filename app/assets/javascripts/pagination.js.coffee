if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
    more_posts_url = $('.pagination .next_page a').attr('href')
    if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 90
        $('.pagination').html('<img src="/images/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
        $.getScript more_posts_url
    return
return  
