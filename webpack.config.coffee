module.exports = (require "art-foundation/configure_webpack")
  entries: "app"
  outputPath: "cordova/www"
  package:
    dependencies:
      "art-suite":      "git://github.com/imikimi/art-suite.git"
