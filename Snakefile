configfile: "config.yaml"

SAMPLES = config['SAMPLES']

rule all:
      input:
           expand("{cohort}.vcf.gz", cohort=config['COHORT']),
           expand("{output}_cmc", output =config['OUTPUT'])
 
rule bgzip:       
     input:
        "{cohort}.vcf"
     output:
       "{cohort}.vcf.gz"
     conda: 'env/env-htslib.yaml' 
     shell:
         """
         bgzip -c {input} > {output}
         """

rule tabix:
     input:
        "{cohort}.vcf.gz"
     output:
        "{cohort}.vcf.gz.tbi"
     conda: 'env/env-htslib.yaml'
     shell:
         """
         tabix -p vcf {input}
         """

rule cmc:
   input: 
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params: 
      ped = expand("{cohort}.ped", cohort= config['COHORT']), 
      genefile = config['GENEFILE'], 
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_cmc", output =config['OUTPUT']) 
   shell: 
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --burden cmc 
        """

 
