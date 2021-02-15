if (document.URL.match(/edit_icon/)) {
  document.addEventListener('DOMContentLoaded', function(){
    document.getElementById('user-icon-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const CurrentPreviewImage = document.getElementById('current-preview-image');
      CurrentPreviewImage.setAttribute('src', blob);
    });
  });
};