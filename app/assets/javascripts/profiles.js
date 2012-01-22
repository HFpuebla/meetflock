(function() {
  var page = 1,
      loading = false;

  function nearBottomOfPage() {
    return $(window).scrollTop() > $(document).height() - $(window).height() - 200;
  }

  $(window).scroll(function(){
    if (loading) {
      return;
    }

    if(nearBottomOfPage()) {
      loading=true;
      page++;
      $.ajax({
        url: searchURL(page),
        type: 'get',
        dataType: 'script',
        success: function() {
          $(window).sausage('draw');
          loading=false;
        }
      });
    }
  });

  $(window).sausage();
}());

function searchURL (page) {
	if (window.location.search)
		return window.location.search + '&page=' + page
	else
		return '?page=' + page
}

$('.submittable').live('change', function() {
	$(this).parents('form:first').submit();
});