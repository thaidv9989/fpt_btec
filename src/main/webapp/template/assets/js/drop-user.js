/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function dropdownFunc() {
  document.getElementById("drop").classList.toggle("show");
}
// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
  if (!event.target.matches(".btn-drop-user")) {
    var dropdowns = document.getElementsByClassName("header-sub-nav");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains("show")) {
        openDropdown.classList.remove("show");
      }
    }
  }
};
