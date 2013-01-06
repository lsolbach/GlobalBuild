#!/bin/sh
# buildshell.sh
# sets the environment for the build

# set GLOBAL_BUILD_HOME to script path
pushd . > /dev/null
GLOBAL_BUILD_HOME="${BASH_SOURCE[0]}";
if ([ -h "${GLOBAL_BUILD_HOME}" ]) then
	while([ -h "${GLOBAL_BUILD_HOME}" ]) do cd `dirname "$GLOBAL_BUILD_HOME"`; SCRIPT_PATH=`readlink "${GLOBAL_BUILD_HOME}"`; done
fi
cd `dirname ${GLOBAL_BUILD_HOME}` > /dev/null
GLOBAL_BUILD_HOME=`pwd`;
popd  > /dev/null
export GLOBAL_BUILD_HOME
export USER_BUILD_HOME="$HOME/.GlobalBuild"

# set DEV_HOME if not already set
if [ -n "${DEV_HOME:-x}" ]; then
	export DEV_HOME="$HOME/devel"
fi

# load environment
if [ -x $GLOBAL_BUILD_HOME/env/linux/env.sh ]; then
	. $GLOBAL_BUILD_HOME/env/linux/env.sh
else
	echo "WARNING: $GLOBAL_BUILD_HOME/env/linux/env.sh not found!"
	echo "WARNING: Not a valid build environment!"
fi

# load user specific settings
if [ -x $USER_BUILD_HOME/user_env.sh ]; then
	. $USER_BUILD_HOME/user_env.sh
else
	echo "INFO: No user specific settings found."
fi

# set path
export PATH=$ANT_HOME/bin:$ASPECTJ_HOME/bin:$JAVA_HOME/bin:$PATH
