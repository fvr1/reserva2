// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function () {
  const reservationFormDiv = $('#reservation-form');
  reservationFormDiv.hide();
  $('.data-block').on('click', () => {
    reservationFormDiv.show();
  });

  const reservationBtn =  $('#reservation-btn');
  const nameInput = $('#reservation-form input#name');
  let nameValue;
  nameInput.on('change', (event) => {
    nameValue = event.target.value;
  });
  reservationBtn.on('click', () => {
    /*
      Debería hacer el post a algun controlador => debe crear el bloque, el estado y la reserva misma
    */
    $.ajax({
      url: `/reservations/?name=${nameValue}`,
      type: "post",
      data: { nameValue },
      success: function () {
        alert('Saved Successfully');
      },
      error: function () {
        alert('Error');
      }
    });
  });
});
