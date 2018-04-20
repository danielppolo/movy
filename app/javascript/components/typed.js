import Typed from 'typed.js';

var options = {
  strings: ["Honda", "Vespa", "Turin", "Cali", "Mexico City", "Ancona", "Brindisi", "Murcia", "Paris", "Bordeaux", "Abruzzo", "San Francisco"],
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


export { typed };
