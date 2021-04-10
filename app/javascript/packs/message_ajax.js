if (location.pathname.match("rooms") && location.pathname.match("messages")) {
  document.addEventListener('DOMContentLoaded', function() {
    const reloadBtn = document.getElementById('reload_btn');
    const userId = $('.user-id').val();
    const displayMessages = document.getElementById('messages');
    function messagesReload() {
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `${location.pathname}/reload`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        displayMessages.innerHTML = "";
        const messages = XHR.response.messages;
        messages.forEach((message) => {
          const messageWrap = document.createElement("div");
          messageWrap.setAttribute("class", "message-wrap");
          const messageWrapChild = document.createElement("div");
          if (message.user_id == userId) {
            messageWrapChild.setAttribute("class", "message-wrap-right");
          } else {
            messageWrapChild.setAttribute("class", "message-wrap-left");
          };
          const messageElement = document.createElement("p");
          messageElement.setAttribute("class", "message");
          messageElement.innerHTML = message.text;
          const messageTime = document.createElement("p");
          messageTime.setAttribute("class", "message-time");
          messageTime.innerHTML = message.created_at;
          messageWrap.appendChild(messageWrapChild);
          if (message.user_id == userId) {
            messageWrapChild.appendChild(messageTime);
            messageWrapChild.appendChild(messageElement);
          } else {
            messageWrapChild.appendChild(messageElement);
            messageWrapChild.appendChild(messageTime);
          };
          displayMessages.appendChild(messageWrap);
          displayMessages.scrollTop = displayMessages .scrollHeight;
        });
      };
    };
    setInterval(messagesReload, 1000);
  });
};