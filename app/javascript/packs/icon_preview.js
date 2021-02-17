if (document.URL.match(/users/)) {
  document.addEventListener('DOMContentLoaded', function(){
    if (document.getElementById('user-icon-image') != null) {
      document.getElementById('user-icon-file').addEventListener('change', function(e){
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        const CurrentPreviewImage = document.getElementById('user-icon-image');
        CurrentPreviewImage.setAttribute('src', blob);
      });
    } else {
      document.getElementById('user-icon-file').addEventListener('change', function(e){
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        const CurrentPreviewImage = document.getElementById('user-icon-default');
        CurrentPreviewImage.setAttribute('src', blob);
      });
    };
  });
};