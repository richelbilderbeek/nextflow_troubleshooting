# Cannot find Java or it's a wrong version

This is a line that should always work:

```
nextflow run nf-core/nanoseq -profile test,singularity --outdir nanoseq_results 
```

However, directly at the start, one can get this error:

```
ERROR: Cannot find Java or it's a wrong version -- please make sure that Java 8 or later (up to 18) is installed
NOTE: Nextflow is trying to use the Java VM defined by the following environment variables:
 JAVA_CMD: /usr/bin/java
 JAVA_HOME: 
```

  1. Do not use (Singularity 3.11.1)[https://github.com/sylabs/singularity/issues/1669#issuecomment-1543598933],
     upgrade to a newer version instead
  2. Export the `JAVA_HOME` and `JAVA_CMD` variables

This can be done by 

  1. run [this script](scripts/update_singularity.sh):

```
sudo ./scripts/update_singularity.sh
```

  2. `source` [this script](scripts/fix_java_error.sh):

```
. ./fix_java_error.sh
source fix_java_error.sh
```

See [here](https://stackoverflow.com/a/16619261) for an explanation of the `.`/`source` in front of calling the script.
