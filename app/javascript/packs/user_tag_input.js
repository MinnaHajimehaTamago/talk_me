if (location.pathname.match("tags/new")) {
  document.addEventListener('DOMContentLoaded', function() {
    const TagLists = document.getElementById('tag-lists');
    
    document.getElementById('tag_add_btn').addEventListener('click', () => {
      const tagName = document.getElementById("users_tag_name")
      const registrationTag = document.createElement('div');
      registrationTag.innerHTML = tagName.value;
      TagLists.appendChild(registrationTag);
      tagName.value = '';
    });
  });
};