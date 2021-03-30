if (location.pathname.match("signs/search_index")) {
  document.addEventListener('DOMContentLoaded', function() {
    const TagLists = document.getElementById('tag_lists');
    const inputElement = document.getElementById("input");
    let tagCount = 0;

    document.getElementById('tag_add_btn').addEventListener('click', () => {
      if (inputElement.value != "") {
        const registrationTag = document.createElement('div');
        registrationTag.setAttribute('id', "tag_element");
        registrationTag.setAttribute('class', 'tag-element');
        let registrationTagNum = tagCount;
        const inputHTML = document.createElement('input');
        inputHTML.setAttribute('id', `search_tag_${registrationTagNum}`);
        inputHTML.setAttribute('name', 'search_tag[names][]');
        inputHTML.setAttribute('type', 'text');
        inputHTML.setAttribute('class', 'hide');
        registrationTag.innerHTML = inputElement.value;
        registrationTag.appendChild(inputHTML);
        TagLists.appendChild(registrationTag);
        let registrationTagInput = document.getElementById(`search_tag_${registrationTagNum}`);
        registrationTagInput.value = inputElement.value;
        inputElement.value = "";
        tagCount += 1;
      };
    });

    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("input").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `../tags/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "tag-candidate");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              const registrationTag = document.createElement('div');
              registrationTag.setAttribute('id', "tag_element");
              registrationTag.setAttribute('class', 'tag-element');
              let registrationTagNum = tagCount;
              const inputHTML = document.createElement('input');
              inputHTML.setAttribute('id', `signs_tag_${registrationTagNum}`);
              inputHTML.setAttribute('name', 'signs_tag[names][]');
              inputHTML.setAttribute('type', 'text');
              inputHTML.setAttribute('class', 'hide');
              registrationTag.innerHTML = tag.name;
              registrationTag.appendChild(inputHTML);
              TagLists.appendChild(registrationTag);
              let registrationTagInput = document.getElementById(`signs_tag_${registrationTagNum}`);
              registrationTagInput.value = tag.name
              inputElement.value = "";
              searchResult.innerHTML = "";
              tagCount += 1;
            });
          });
        };
      };
    });

    $('#tag_lists').on('mouseover', function (){
      $('#tag_element').on('click', function () {
        $(this).remove();
      });
    });

  });
};