// if (location.pathname.match("signs")) {
//   document.addEventListener('DOMContentLoaded', function() {
//     const TagLists = document.getElementById('tag_lists');
//     const inputElement = document.getElementById("sign_tag_input");
//     const addBtn = document.getElementById('tag_add_btn');
//     let tagCount = 0;

//     addBtn.addEventListener('click', () => {
//       if (inputElement.value != "") {
//         const registrationTag = document.createElement('div');
//         registrationTag.setAttribute('id', "tag_element");
//         registrationTag.setAttribute('class', 'tag-element');
//         let registrationTagNum = tagCount;
//         const inputHTML = document.createElement('input');
//         inputHTML.setAttribute('id', `signs_tag_${registrationTagNum}`);
//         inputHTML.setAttribute('name', 'tag[names][]');
//         inputHTML.setAttribute('type', 'text');
//         inputHTML.setAttribute('class', 'hide');
//         registrationTag.innerHTML = inputElement.value;
//         registrationTag.appendChild(inputHTML);
//         TagLists.appendChild(registrationTag);
//         let registrationTagInput = document.getElementById(`signs_tag_${registrationTagNum}`);
//         registrationTagInput.value = inputElement.value;
//         addBtn.style.backgroundColor = 'lightgray';
//         addBtn.style.cursor = 'default'
//         inputElement.value = "";
//         const searchResult = document.getElementById("search-result");
//         searchResult.innerHTML = "";
//         tagCount += 1;
//       };
//     });

//     inputElement.addEventListener("keyup", () => {
//       const keyword = document.getElementById("signs_tag_input").value;
//       const XHR = new XMLHttpRequest();
//       XHR.open("GET", `../tags/search/?keyword=${keyword}`, true);
//       XHR.responseType = "json";
//       XHR.send();
//       XHR.onload = () => {
//         const searchResult = document.getElementById("search-result");
//         searchResult.innerHTML = "";
//         if (XHR.response) {
//           const tagName = XHR.response.keyword;
//           tagName.forEach((tag) => {
//             const childElement = document.createElement("div");
//             childElement.setAttribute("class", "tag-candidate");
//             childElement.setAttribute("id", tag.id);
//             childElement.innerHTML = tag.name;
//             if (tag.officiality_id == 1) {
//               const officialMark = document.createElement("img");
//               officialMark.src = "/assets/official_mark.png";
//               childElement.appendChild(officialMark);
//             };
//             searchResult.appendChild(childElement);
//             const clickElement = document.getElementById(tag.id);
//             clickElement.addEventListener("click", () => {
//               const registrationTag = document.createElement('div');
//               registrationTag.setAttribute('id', "tag_element");
//               registrationTag.setAttribute('class', 'tag-element');
//               let registrationTagNum = tagCount;
//               const inputHTML = document.createElement('input');
//               inputHTML.setAttribute('id', `signs_tag_${registrationTagNum}`);
//               inputHTML.setAttribute('name', 'signs_tag[names][]');
//               inputHTML.setAttribute('type', 'text');
//               inputHTML.setAttribute('class', 'hide');
//               registrationTag.innerHTML = tag.name;
//               if (tag.officiality_id == 1) {
//                 const officialMark = document.createElement("img");
//                 officialMark.src = "/assets/official_mark.png";
//                 registrationTag.appendChild(officialMark);
//               };
//               registrationTag.appendChild(inputHTML);
//               TagLists.appendChild(registrationTag);
//               let registrationTagInput = document.getElementById(`signs_tag_${registrationTagNum}`);
//               registrationTagInput.value = tag.name          
//               inputElement.value = "";
//               searchResult.innerHTML = "";
//               addBtn.style.backgroundColor = 'lightgray';
//               addBtn.style.cursor = 'default'
//               tagCount += 1;
//             });
//           });
//         };
//       };

//       if (inputElement.value != "") {
//         addBtn.style.backgroundColor = '#80a8ff';
//         addBtn.style.cursor = 'pointer'
//       };
//     });

//     $('#tag_lists').on('mouseover', function (){
//       $('#tag_element').on('click', function () {
//         $(this).remove();
//       });
//     });

//   });
// };