# Cannot find Java or it's a wrong version

```
ERROR: Cannot find Java or it's a wrong version -- please make sure that Java 8 or later (up to 18) is installed
NOTE: Nextflow is trying to use the Java VM defined by the following environment variables:
 JAVA_CMD: /usr/bin/java
 JAVA_HOME: 
```

Do:

```
export JAVA_HOME=$(readlink -f `which javac` | sed "s:/bin/javac::") ; export JAVA_CMD="${JAVA_HOME}/bin/java"
```

Or run [scripts/fix_java_error.sh](scripts/fix_java_error.sh):

```
. ./fix_java_error.sh
source fix_java_error.sh
```

See [here](https://stackoverflow.com/a/16619261) for an explanation of the `.`/`source` in front of calling the script.
