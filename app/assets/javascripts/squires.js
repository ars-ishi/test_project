$(document).on('turbolinks:load', function() {
  console.log('test');
  var UI = new SquireUI({
    replace: 'textarea#seditor',
    buildPath: "/",
    height: 300
    });
    $('form').submit(function() {
      $('#squire_description').val(UI.getHTML()).change();
  });
});
