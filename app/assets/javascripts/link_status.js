$(document).ready(function() {

  $('tr.link-row').on('click', function(event) {

    if (event.target.innerText === "Edit") {
      return
    } else {

      var buttonText = event.target.text;
      var linkId = event.target.dataset.id;

      event.preventDefault();
      updateStatus(buttonText, linkId);
    }

    function updateStatus (buttonText, linkId) {

      $.ajax({
        url: '/update-status',
        type: 'post',
        data: {link: { id: linkId}},
        success: function(data) {
          var buttonText = event.target.text;
          var getRow = event.target.parentNode.parentNode;

          if ( buttonText.localeCompare("Mark as Read") ) {
            event.target.text = "Mark as Read"
            var linkId        = event.target.dataset.id;
            var buildId       = "#link-status-" + linkId
            $(buildId).text   = 'Read';

            $(getRow).addClass('black').removeClass('red')
          } else {
            event.target.text = "Mark as Unread"
            var linkId        = event.target.dataset.id;
            var buildId       = "#link-status-" + linkId
            $(buildId).text   = 'Unread';

            $(getRow).addClass('red').removeClass('black')
          }

        },
        error: function(xhr) {
          console.log(xhr.responseText)
        }
      });

    }
  });

  $('#links').DataTable( {
    "order": [[ 3, "desc" ]]
  } );
});




