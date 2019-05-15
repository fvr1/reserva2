$(document).on('turbolinks:load', function () {
  $('.block').click(function() {
    const blockId = $(this).data('block-id');
    const blockDate = $(this).data('date');
    $('#state-date').val(blockDate);
    $('#state-block').val(blockId);
  });
});
