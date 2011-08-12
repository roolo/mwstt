---
layout: default
title: How to run it
---
### Run mwstt on Mac OS X (Snow Leopard/Lion)
On other platforms this procedure should be similar

#### If you not have Ruby 1.9 installed
- install macports - http://www.macports.org/install.php
- sudo port install ruby19

#### Procedure same across all platforms
- open Terminal/Commandline/Whatever for running commands
- sudo gem1.9 install bundler
- cd &lt;project dir&gt;
- sudo bundle
- rake1.9 db:migrate
- ./script/rails s
- NOW YOU ARE RUNNING MWSTT 

More coming soooooooooooon… ;)

