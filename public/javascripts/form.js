$(document).ready(function() {
  $('input').change(function() {
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
});
