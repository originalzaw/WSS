	

$(document).ready(function() {
    $('#right-menu').sidr({
      name: 'sidr-right',
      side: 'right'
    });
});
jQuery('#sidr-right #second li a').click(function() { jQuery.sidr('close', 'sidr-right'); });