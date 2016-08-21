$(document).ready ->
  speed = $('.carousel').data('speed')

  $('.carousel').slick({
    autoplay: true,
    autoplaySpeed: speed,
    arrows: false,
    draggable: false,
    pauseOnFocus: false,
    pauseOnHover: false
  })
