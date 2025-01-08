function toggleNav() {
  var sideNav = document.getElementById("mySidenav");
  if (sideNav.style.width === "0px" || sideNav.style.width === "") {
      openNav();
  } else {
      closeNav();
  }
}

  function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  }

  function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  }

  function setActiveTab(tabId) {
          // Remove 'current-tab' class from all links
          var links = document.querySelectorAll('.sidenav a');
          links.forEach(function(link) {
              link.classList.remove('current-tab');
          });

          // Add 'current-tab' class to the selected tab
          var currentTab = document.getElementById(tabId);
          if (currentTab) {
              currentTab.classList.add('current-tab');
          }
      }


  //  function checkSideNavState() {
  // console.log("Checking side nav state...");
  // var sideNav = document.getElementById("mySidenav");
  // if (sideNav.style.width !== "0px" && sideNav.style.width !== "") { // Check if side nav is open
  //     sideNav.style.width = "0";
  //     document.getElementById("main").style.marginLeft= "0";
  // }
  // } 

  // Call the function when the document is loaded
  document.addEventListener("DOMContentLoaded", function() {
// checkSideNavState(); 
  });