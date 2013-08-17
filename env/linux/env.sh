#!/bin/sh
# env.sh
# Setup of the build environment variables

# set build os
export BUILD_OS="linux"

# set DEV_HOME if not already set
if [ -n "${DEV_HOME:-x}" ]; then
	export DEV_HOME="$HOME/devel"
fi

# set java home
if [ -n "${JAVA_HOME:-x}" ]; then
	export JAVA_HOME="$DEV_HOME/tools/jdk"
fi

# set aspectj home
if [ -n "${ASPECTJ_HOME:-x}" ]; then
	export ASPECTJ_HOME="$DEV_HOME/tools/aspectj"
fi

# set ant variables
if [ -n "${ANT_HOME:-x}" ]; then
	export ANT_HOME="$DEV_HOME/tools/apache-ant"
fi
export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=256m"
#export ANT_ARGS="-lib $GLOBAL_BUILD_HOME/tools/jdepend/lib"
