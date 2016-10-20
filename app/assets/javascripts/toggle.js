document.addEventListener('turbolinks:load', function() {
  $('#menu-toggle').click(function(e) {
    e.preventDefault();
    $('#wrapper').toggleClass('toggled');
  });
  $('.add-answer').click(function(e){
    var index = $(this).parents('.box-answers').find('.form-control').length;
    $(this).parents('.box-answers').prepend("\
    <input type='text'\
      name='word[answers_attributes][" + index +"][answer_content]]'\
      class='form-control' placeholder='Answer Content' />\
    <input type='checkbox'\
      value='true' name='word[answers_attributes][" + index +"][is_correct]'\
      class='form-checkbox' /><p>True answer</p>");
  });
});
