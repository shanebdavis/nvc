module.exports =
  package:
    dependencies:
      "art-suite":      "git://github.com/imikimi/art-suite.git"

  webpack:
    common:
      output: path: "./docs"
    targets:
      index: {}
