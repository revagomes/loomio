$ ->
  btn = $("#subscription-submit")
  text = btn.val()
  $("input[name='subscription_form[preset_amount]']").change ->
    if $("input[name='subscription_form[preset_amount]']:checked").val() == '0'
      $("#lovenote").show()
      btn.val("Submit")
      btn.attr("data-disable-with", "Submit")
    else
      $("#lovenote").hide()
      btn.val(text)
      btn.attr("data-disable-with", text)

$ ->
  $("#subscription_form_preset_amount_custom").click ->
    $("input#subscription_form_custom_amount").focus()

$ ->
  $('#js-dismiss').click ->
    $('#js-banner').hide()
    $('.navbar-fixed-top').removeClass('js-campaign')
    $('.logged-in-navigation').removeClass('js-campaign')
    $('.main-container.container').css('padding-top', '40px')
