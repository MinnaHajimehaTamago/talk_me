if (location.pathname.match("rooms") && location.pathname.match("messages")) {
  document.addEventListener('DOMContentLoaded', function() {
    var target = document.getElementById("messages");
    target.scrollTop = target.scrollHeight;
  });
};