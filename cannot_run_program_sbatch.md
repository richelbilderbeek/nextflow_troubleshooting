# Cannot run program "sbatch"

This is a line that should always work:

```
nextflow run nf-core/nanoseq -profile test,singularity --outdir nanoseq_results 
```

However, this error can pop up:

```
java.io.IOException: Cannot run program "sbatch" (in directory "/your_folder/work/ac/8ce701d7678f94c2c6ea5c60d2fd39"): error=2, No such file or directory
```

This can happen when there is a config file in 
[the place where Nextflow searches](https://www.nextflow.io/docs/latest/config.html).
 * `nextflow.config` in the current directory
 * `nextflow.config` in the workflow project directory
 * The config file `$HOME/.nextflow/config`

Remove/move that config file. 
