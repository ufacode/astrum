#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require nprogress
#= require nprogress-turbolinks
#= require_tree .

jQuery ($)->

  initialize = ->
    $('.intro-tables, .parallax, header').css('opacity', '0')
    $('.preloader').addClass('animated fadeOut').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
      $('.preloader').hide()
      $('.parallax, header').addClass('animated fadeIn').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
        $('.intro-tables').addClass('animated fadeInUp').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend')

    #    if $(window).height() > $(window).width()
    #      ratio = $('.parallax').width() / $('.parallax').height()
    #      $('.parallax img').css('height', ($(window).height()) + 'px')
    #      $('.parallax img').css('width', $('.parallax').height() * ratio + 'px')

    $intro = $('#intro')
    if $intro.length > 0
      $('#intro').height($(window).height() + 80)
      $('section .cut').each ->
        if ($(this).hasClass('cut-top'))
          $(this).css('border-right-width', $(this).parent().width() + "px")
        else if ($(this).hasClass('cut-bottom'))
          $(this).css('border-left-width', $(this).parent().width() + "px")
      onScroll = ->
        if $(window).scrollTop() > 50
          $('nav.original').css('opacity', '0')
          $('nav.navbar-fixed-top').css('opacity', '1')
        else
          $('nav.original').css('opacity', '1')
          $('nav.navbar-fixed-top').css('opacity', '0')

      window.addEventListener('scroll', onScroll, false)


    # Navbar Init
    $('nav').addClass('original').clone().insertAfter('nav').addClass('navbar-fixed-top').css('position', 'fixed').css('top', '0').css('margin-top', '0').removeClass('original')
    $('.mobile-nav ul').html($('nav .navbar-nav').html())
    $('nav.navbar-fixed-top .navbar-brand img').attr('src', $('nav.navbar-fixed-top .navbar-brand img').data("active-url"))


  $(window).load -> initialize()
  $(document).on 'turbolinks:render', -> initialize()

