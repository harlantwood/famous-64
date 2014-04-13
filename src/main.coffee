define( (require, exports, module) -> 
  Engine   = require('famous/core/Engine')
  Surface  = require('famous/core/Surface')
  GridLayout = require('famous/views/GridLayout')
  StateModifier = require('famous/modifiers/StateModifier')
  Transform = require('famous/core/Transform')
  TransitionableTransform = require("famous/transitions/TransitionableTransform")
  Modifier = require("famous/core/Modifier");

  mainContext = Engine.createContext()

  transitionableTransform = new TransitionableTransform()
  transitionableTransform.setScale([2,2,0], {duration: 3000})
  # modifier = new Modifier {
  #   # origin: [.5,.5],
  #   transform: transitionableTransform
  # }

  modifiers = for i in [1..64]
    new Modifier {
      transform: transitionableTransform
      # opacity: transitionItem.opacity
      # size: transitionItem.size
    }
# +  modifier = new Modifier {
# +    # origin: [.5,.5],
# +    transform: transitionableTransform
# +  }
# +

  console.log     modifiers

  grid = new GridLayout({
    dimensions: [8, 8]
    modifiers
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
        # stateModifier = new StateModifier()
        # stateModifier.setTransform Transform.translate(100, 300, 100),
        #   duration: 1000
        #   curve: "easeInOut"

        mainContext.add(modifier).add(surface)
        # add(stateModifier).
      surfaces.push surface
  mainContext.add(grid)
)
