module.exports = (require "art-foundation/configure_webpack")
  entries: "app"
  outputPath: "cordova/www"
  package:
    dependencies:
      "art-suite":      "git://github.com/Imikimi-LLC/art-suite.git"
