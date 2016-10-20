{defineModule, rgbColor, HotStyleProps} = require 'art-suite'
defineModule module, class StyleProps extends HotStyleProps

  @primaryColor: rgbColor "#8ebdf6"
  @leafColor:    rgbColor "#fff9ad"

  @textStyle:
    color: "#000a"
    fontFamily: "sans-serif"
    fontSize: 18 #if subMap then 18 else 16
