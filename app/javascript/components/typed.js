import Typed from 'typed.js';

var options = {
  strings: ["Honda", "Vespa", "Sport","Scooter", "Outdoor", "BMW", "Yamaha"],
  typeSpeed: 40,
  loop: true,
  attr: "placeholder",
  // shuffle: true,
  // loopCount: Infinity,
  showCursor: true,
  cursorChar: '|',
  autoInsertCss: true,
}

var typed = new Typed("#searchbar-js", options);
var typed = new Typed("#searchbar-mobile", options);


export { typed };
