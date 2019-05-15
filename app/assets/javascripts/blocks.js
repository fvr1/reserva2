$(document).on('turbolinks:load', function () {
  $('.block').click(function() {
    const blockId = $(this).data('block-id');
    const blockDate = $(this).data('date');
    const blockAvailable = $(this).hasClass('available');

    const msDate = Date.parse(blockDate);
    const blockDateObj = new Date(msDate + 4 * 60 * 60 * 1000); // Adjust ZoneTime

    $('#state-date').val(blockDate);
    $('#pre-reservation-date').text(blockDateObj.toDateString());
    $('#pre-reservation-time').text(blockDateObj.toLocaleTimeString());

    $('#state-block').val(blockId);

    if (blockAvailable) {
      $('#reservation-form').show();
      $('#not-available-block').hide();
    } else {
      $('#reservation-form').hide();
      $('#not-available-block').show();
    }
  });
});
