define(function(require, exports, module) {
    var Engine     = require('famous/core/Engine');
    var Surface    = require('famous/core/Surface');
    var GridLayout = require('famous/views/GridLayout');

    var mainContext = Engine.createContext();

    var grid = new GridLayout({
        dimensions: [8, 8]
    });

    var surfaces = [];
    grid.sequenceFrom(surfaces);

    for (var i = 0; i < 64; i++) {
        surfaces.push(new Surface({
            content: i + 1,
            size: [undefined, undefined],
            properties: {
                backgroundColor: 'hsl(' + (i * 360 / 8) + ', 62%, 62%)',
                color: 'black',
                border: 'solid black',
                lineHeight: window.innerHeight / 8 + 'px',
                textAlign: 'center'
            }
        }));
    }

    mainContext.add(grid);
});
