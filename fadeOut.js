$('a').click(function(evt){
  evt.preventDefault();
  console.log('Works');
  $(this).fadeOut();
})
