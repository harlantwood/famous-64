define(function (require, exports, module) {
  var Engine = require("famous/core/Engine");
  var Surface = require("famous/core/Surface");
  var StateModifier = require('famous/modifiers/StateModifier');

  var mainContext = Engine.createContext();
  var x = 0, y = 0;


  for (var i = 0; i < 64; i++) {
    var box = new Surface({
      content: i + 1,
      size: [window.innerWidth / 8, window.innerHeight / 8],
      properties: {
        backgroundColor: "hsl(" + (i * 360 / 8) + ", 62%, 62%)",
        color: "black",
        border: "solid black",
        lineHeight: window.innerHeight / 8 + 'px',
        textAlign: 'center'
      }
    });

    if (i != 0 && i % 8 === 0) {
      x = 0;
      y = y + .142
    }

    console.log("[" + x + "," + y + "]");

    var modifier = new StateModifier({
      origin: [x, y]
    });

    mainContext.add(modifier).add(box);


    box.on('click', function() {
      this.setProperties({
        backgroundColor: '#878785'
      });
    });

    x = x + .142;

  }

});
