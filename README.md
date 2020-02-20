# DRI Functional Genomics Workshop

Material for the Functional Genomics Workshop 28/02/2020

This repository contains all the material regarding the Functional Genomics Workshop including:

* the material or code of 5 of 6 Demos: DAPPLE, GONet, FUMA, PLN
* the slides: Workshop_Functional_Genomics_28_02_2019.pptx
* the articles listed in this worskhop (PMID used as name): references 

## DAPPLE: Protein-Protein Interactions Network

**Instructions** 
To use DAPPLE, you will use the GenePattern deployed on Amazon Cloud: https://cloud.genepattern.org/gp and to create your own account here: https://cloud.genepattern.org/gp/pages/registerUser.jsf

**Contents** 
* list_gene_symbol a set of genes file: 146 genes that are mapped to genome-wide significant loci from Genome-Wide Association Study s of common epilepsies (PMID: 30531953, https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-018-07524-z/MediaObjects/41467_2018_7524_MOESM4_ESM.xlsx)
* The output by running DAPPLE with this list of genes

## GoNet: Gene Ontology analysis

**Instructions**

To run GoNet, you will need to open this URL: https://tools.dice-database.org/GOnet/

**Contents**

* list_gene_symbol a set of genes file: 146 genes that are mapped to genome-wide significant loci from Genome-Wide Association Study s of common epilepsies
* output: network ouput under png and cytoscape format

## FUMA: Tissue expression analysis

**Instructions**

To run FUMA, you will need to open this URL https://fuma.ctglab.nl and to create an account here: https://fuma.ctglab.nl/register

**Contents**

The repository include two examples:
* list_gene_symbol a set of genes file: 146 epilepsy risk genes with output (FUMA_gene2func35125.zip) resulting from GENE2FUNC 
* SNP GWA association study summary stastistic  from schizrophrenia case-control study (https://www.nature.com/articles/s41588-018-0059-2.pdf) with output () resulting from SNP2GENE

## Cytoscape: Complex networks visualisation

**Instructions**

To use Cytoscape, you need to download and install Cytoscape via this URL: https://cytoscape.org/download.html

The repository include two examples:
* sub_net_nervous_info_gene.txt a gene sub-network of 2500 genes build by using multiple of functional annotation (see section phenotypic linkage network):

a set of genes file: 146 epilepsy risk genes with output (FUMA_gene2func35125.zip) resulting from GENE2FUNC 
* SNP GWA association study summary stastistic  from schizrophrenia case-control study (https://www.nature.com/articles/s41588-018-0059-2.pdf) with output (FUMA_job70399.zip) resulting from SNP2GENE

**R Data objects:** 

* TPM expression matrix and the SN cell types identified: `Devika_midbrain.Rdata`
* t-statistic results generated for each gene for different cell type in the SN: `Mid_t_test.Rdata`

**Rmd file:**

There is RMarkdown document including a "complete" version with full R code. 

* Data analysis: `LDSCORE_Analysis_SN.Rmd`

## LSCORE

You will need to download here and install LDSCORE software here: https://github.com/bulik/ldsc

## R packages

You will need to have the following R packages installed: `biomaRt`,`reshape2`. We will use the development versions of the Bioconductor packages.

```{r}
install.packages(c("reshape2"))
## try http:// if https:// URLs are not supported
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("biomaRt")
```

## Useful Resources

* `LDSCORE publication` : Heritability enrichment of specifically expressed genes identifies disease-relevant tissues and cell types
https://www.nature.com/articles/s41588-018-0081-4


