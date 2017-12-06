(function() {
  $(function() {
    $('time.time-ago').timeago();
    $('#comment-this').unbind('click').bind('click', function(ev) {
      ev.preventDefault();
      ev.stopPropagation();
      $(this).closest('form').submit();
      return console.log('comentario enviado');
    });
    $(document).unbind('ajax:success').bind('ajax:success', '#comment-form', function(ev, comment) {
      var comment_time, comment_to_prepend;
      comment_time = new Date(Date.parse(comment.created_at)).toISOString();
      comment_to_prepend = "<div class='comment card z-depth-5'> <div class='row user-info'> <div class='col left-info s2'> <img src='" + comment.user.image + "' /> <p class='center'> " + comment.user.nickname + " </p> </div> <div class='col other-info s10'> <div class='col user-progress l10 s12'> <div class='col s6 level'> <p> Nivel: " + comment.user.progress.level + " </p> </div> <div class='col s6 xp'> <p> XP total: " + comment.user.progress.xp + " </p> </div> </div> </div> <div class='col user-says s10'> <h3> " + comment.user.name + " dice: </h3> </div> <div class='col comment-date s10 right'> <time class='time-ago right' datetime='" + comment_time + "'> " + comment.created_at + " </time> </div> </div> <div class='row comment-body'> <span class='flow-text'> " + comment.content + " </span> </div> <div class='row card-action votes'> <div class='col s4'> <a class='up-vote green-text flow-text'><i class='material-icons left'>thumb_up</i> <p class='txt'> ¡Genial! </p> </a> </div> <div class='col s4'> <a class='down-vote red-text flow-text'><i class='material-icons left'>thumb_down</i> <p class='txt'> ¡Mal! </p> </a> </div> </div> </div>";
      $('#no-comments').remove();
      $('#comment-content').val('');
      $('#comment-content').trigger('autoresize');
      $('.comment-container').prepend(comment_to_prepend);
      return $('time.time-ago').timeago();
    });
    return $(document).unbind('ajax:error').bind('ajax:error', '#comment-form', function(ev, data) {
      return console.log(data);
    });
  });

}).call(this);
