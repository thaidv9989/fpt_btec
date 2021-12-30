function showpassFunc() {
  var x = document.getElementById("codeInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
