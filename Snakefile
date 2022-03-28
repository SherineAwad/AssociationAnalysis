configfile: "config.yaml"

rule all:
      input:
           expand("{cohort}.vcf.gz", cohort=config['COHORT']),
           expand("{output}_cmc", output =config['OUTPUT']), 
           expand("{output}_skat", output=config['OUTPUT']), 
           expand("{output}_price", output = config['OUTPUT']),
           expand("{output}_skato", output =config['OUTPUT']),
           expand("{output}_singlewald", output =config['OUTPUT']),
           expand("{output}_cmat", output =config['OUTPUT']),
           expand("{output}_cmcwald", output =config['OUTPUT']),
           expand("{output}_rarecover", output =config['OUTPUT']),
           expand("{output}_zeggini", output =config['OUTPUT']), 
           expand("{output}_mb", output =config['OUTPUT']), 
           expand("{output}_kbac", output =config['OUTPUT']), 
           expand("{output}_bolt", output =config['OUTPUT'])
 
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

rule skat:
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_skat", output =config['OUTPUT'])
   shell:
        """ 
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --kernel skat 
        """ 

rule price: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_price", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --vt price 
        """
   

rule skato: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_skato", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --kernel skato
        """
rule singlewald: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_singlewald", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --single wald
        """
rule cmat: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_cmat", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --burden cmat
        """

rule cmcwald:
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_cmcwald", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --burden cmcWald
        """ 
rule rarecover:
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_rarecover", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --burden rarecover
        """
rule Zeggini: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_zeggini", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --burden zeggini
        """ 

rule madsonbrowning:
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_mb", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --burden mb
        """ 

rule kbac: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_kbac", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --kernel kbac
        """ 
rule bolt: 
   input:
      expand("{cohort}.vcf.gz", cohort = config['COHORT'])
   params:
      ped = expand("{cohort}.ped", cohort= config['COHORT']),
      genefile = config['GENEFILE'],
      upperfreq = config['UPPER_FREQ']
   output:
      expand("{output}_bolt", output =config['OUTPUT'])
   shell:
        """
        rvtest --inVcf {input} --pheno {params.ped} --freqUpper {params.upperfreq} --out {output}  --geneFile {params.genefile} --meta bolt
        """ 
 
