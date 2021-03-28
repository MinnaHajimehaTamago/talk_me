// if (location.pathname.match("signs")) {
//   document.addEventListener("DOMContentLoaded", () => {
//     const inputElement = document.getElementById("signs_tag_input");
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
//             searchResult.appendChild(childElement);
//             const clickElement = document.getElementById(tag.id);
//             clickElement.addEventListener("click", () => {
//               document.getElementById("signs_tag_input").value = clickElement.textContent;
//               clickElement.remove();
//             });
//           });
//         };
//       };
//     });
//   });
// };