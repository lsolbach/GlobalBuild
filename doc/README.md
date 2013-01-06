GlobalBuild
===========

The GlobalBuild is an ant based build system with build plugins for java, aspectj and
clojure projects.

Features
--------
 * cross platform
 * testing
 * static code analysis

Build Framework
---------------
The build framework consists of the global.*.xml files and the plugins
and tools in the GlobalBuild project. It defines a default build
workflow that can be used and enhanced by the projects.

global.build.xml
definition of the build workflow

global.properties.xml
definition of properties used by the global build

global.tasks.xml
definition of tasks used by the global build

Directory layout
----------------
ant         build files
  plugins	build plugins
cfg         config files for the global build (eg. xsl stylesheets)
  report	report generation
    html	html templates
    xsl		stylesheets
doc         documentation
env
  linux     linux specific scripts to set up the build environment
  windows   windows specific scripts to set up the build environment
src         source of custom ant tasks
tools       tools used in the global build
  linux     linux specific tools
  windows   windows specific tools

Steps in the build workflow
---------------------------
 * clean
 * initialize
 * generate
 * compile
 * unittest
 * doc
 * package
 * test
 * code-quality
 * distribute
 * deploy?
