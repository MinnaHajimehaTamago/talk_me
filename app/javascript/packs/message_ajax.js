if (location.pathname.match("rooms") && location.pathname.match("messages")) {
  document.addEventListener('DOMContentLoaded', function() {
    const userId = $('.user-id').val();
    const displayMessages = document.getElementById('messages');
    let currentMessagesLength = displayMessages.childElementCount;
    function messagesReload() {
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `${location.pathname}/reload`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const messages = XHR.response.messages;
        messageLengthDifference = messages.length - currentMessagesLength;
        if (messages.length != currentMessagesLength) {
          messages.slice(messages.length - 1).forEach((message) => {
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
            messageTime.innerHTML = createdAtFormat(message.created_at);
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
            currentMessagesLength = messages.length;
          });
        };
      };
    };

    function createdAtFormat(time) {
      time = time.toString()
      month = time.substr(5, 2);
      day = time.substr(8, 2);
      hour = time.substr(11, 2);
      minute = time.substr(14, 2);
      display = `${month}/${day} ${hour}:${minute}`;
      return display;
    };
    
    setInterval(messagesReload, 5000);
  });
};