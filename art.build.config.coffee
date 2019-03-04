# don't rename to .caf yet - we need __dirname support
module.exports =
  package:
    dependencies:
      "art-suite":      "git://github.com/imikimi/art-suite.git"

    scripts:
      build:
        """
          echo "Building js..."
          webpack
          echo "Building manifest..."
          caf generateManifest.caf > docs/needs.manifest
          echo "Build done."
        """

  webpack:
    common:
      output: path: "#{__dirname}/docs"
    targets:
      index: {}
