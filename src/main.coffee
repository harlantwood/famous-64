define( (require, exports, module) -> 
  Engine   = require('famous/core/Engine')
  Surface  = require('famous/core/Surface')
  GridLayout = require('famous/views/GridLayout')
  StateModifier = require('famous/modifiers/StateModifier')
  Transform = require('famous/core/Transform')

  mainContext = Engine.createContext()

  grid = new GridLayout({
    dimensions: [8, 8]
  })

  surfaces = []
  grid.sequenceFrom(surfaces)

  # for (i = 0 i < 64 i++) {
  for i in [1..64]
    # console.log i
    do (i) ->
      surface = new Surface {
        content: i + 1,
        size: [undefined, undefined],
        properties:
          backgroundColor: 'hsl(' + (i * 360 / 8) + ', 62%, 62%)',
          color: 'black',
          border: 'solid black',
          lineHeight: window.innerHeight / 8 + 'px',
          textAlign: 'center'
      }
      surface.on "click", ->
        surface.setProperties backgroundColor: "#878785"
        stateModifier = new StateModifier()
        stateModifier.setTransform Transform.translate(300, 300, 100),
          duration: 1000
          curve: "easeInOut"

        transitionableTransform = new TransitionableTransform()
        transitionableTransform.setScale([3,3,1], {duration: 3000})
        modifier = new Modifier {
          origin: [.5,.5],
          transform: transitionableTransform
        }
        mainContext.add(stateModifier).add(modifier).add(surface)
      surfaces.push surface

    mainContext.add(grid)

    # var transitionableTransform = new TransitionableTransform();
    
    # var modifier = new Modifier({
    #     origin: [.5,.5],
    #     transform: transitionableTransform
    # });

    # surface.on("click", function(){
    #     transitionableTransform.setScale([3,3,1], {duration: 3000});
    # });



)
