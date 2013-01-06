Global Build Deployment
=======================

Linux
-----
Unpack the GlobalBuild archive into your development directory.

If you unpacked the zip archive instead of the gzip archive on Linux you have to set some execute permissions on the shell scripts.

```
chmod 755 GlobalBuild/tools/ant/bin/ant
chmod 755 GlobalBuild/tools/ant/bin/antRun
chmod 755 GlobalBuild/env/linux/*.sh
chmod 755 GlobalBuild/*.sh
```

The package "graphviz" is expected on Linux systems under "/opt/graphviz".

Windows
-------
Just unzip the GlobalBuild archive into your development directory. 
