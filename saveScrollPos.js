(function() {
  // Check if browser supports localStorage
  var localStorageSupport = function() {
    try {
      return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
      return false;
    }
  };
  if (!localStorageSupport()) {
    return;
  }

  // Loads scroll position from localStorage (if it is set) and scrolls page
  var savedScrollX = parseInt(localStorage.getItem("scrollX")) || 0;
  var savedScrollY = parseInt(localStorage.getItem("scrollY")) || 0;
  window.scroll(savedScrollX, savedScrollY);

  // Saves scroll position to localStorage when window is closing
  window.onunload = function() {
    var scrollX, scrollY;

    if (window.pageXOffset !== undefined) {
      scrollX = window.pageXOffset;
      scrollY = window.pageYOffset;
    } else if ((document.compatMode || "") === "CSS1Compat") {
      scrollX = document.documentElement.scrollLeft;
      scrollY = document.documentElement.scrollTop;
    } else {
      scrollX = document.body.scrollLeft;
      scrollY = document.body.scrollTop;
    }

    localStorage.setItem("scrollX", scrollX);
    localStorage.setItem("scrollY", scrollY);
  };
})();
