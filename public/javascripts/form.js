$(document).ready(function() {
  $("input[type='radio']").change(function() {
    var selectedVal = $("input[type='radio']:checked").val();
    switch (selectedVal) {
      case 'hour':
        $('#visit_id').hide()
        $('#visit_field_id').prop('disabled',true);
        $('#hour_id').show()
        $('#hour_field_id').prop('disabled',false);
        break

      case 'visit':
        $('#hour_id').hide()
        $('#hour_field_id').prop('disabled',true);
        $('#visit_id').show()
        $('#visit_field_id').prop('disabled',false);
        break
    }
  });

  $("input[type='checkbox']").change(function() {
    var passwordChecked = $("#password_checkbox_id").is(':checked');
    if (passwordChecked == true) {
      $('#password_id').show()
      $('#password_field_id').prop('disabled',false);
    }
    else {
      $('#password_id').hide()
      $('#password_field_id').prop('disabled',true);
    }
  });

  $(".form input[type='submit']").click(function() {
    var passwordChecked = $('#password_checkbox_id').is(':checked')
    if (passwordChecked == true) {
      var text = $('#text_id').val();
      var secret = $('#password_field_id').val();
      var iv = CryptoJS.lib.WordArray.random(16);
      var encrypted = '' + CryptoJS.AES.encrypt(text, secret);
      $('#encrypted_text_id').val(encrypted);
      $('#encrypted_text_id').prop('disabled', false);
      $('#iv_id').val(iv);
      $('#iv_id').prop('disabled', false);
      $('#text_id').prop('disabled', true);
    }
  });

  $("#password_form input[type='submit']").click(function() {
    $('#password_form').submit(false);
    var encrypted = $('#encrypted_text').text().trim();
    var iv = $('#encrypted_text_iv').text();
    var password = $('#password_id').val();
    var decrypted = CryptoJS.AES.decrypt(encrypted, password);
    decrypted_text = decrypted.toString(CryptoJS.enc.Utf8);
    $('.text_output').text(decrypted_text);
    $('.message').show();
  })
});

