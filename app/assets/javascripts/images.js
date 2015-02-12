$(function () {
  var uploader = $('#s3-uploader');
  uploader.S3Uploader(
    {
      remove_completed_progress_bar: false,
      progress_bar_target: $('#uploads_container'),
      before_add: function (file) {
        if (file.size > 10485760) {
          alert('Maximum file size is 10 MB');
          return false;
        } else {
          return true;
        }
      }
    }
  );

  // error handling
  uploader.bind('s3_upload_failed', function (e, content) {
    return alert(content.filename + ' failed to upload.');
  });

  var primary_uploader = $('#s3-uploader-primary');
  primary_uploader.S3Uploader(
    {
      remove_completed_progress_bar: false,
      progress_bar_target: $('#uploads_container_primary'),
      before_add: function (file) {
        if (file.size > 10485760) {
          alert('Maximum file size is 10 MB');
          return false;
        } else {
          return true;
        }
      }
    }
  );

  // error handling
  primary_uploader.bind('s3_upload_failed', function (e, content) {
    return alert(content.filename + ' failed to upload.');
  });

});