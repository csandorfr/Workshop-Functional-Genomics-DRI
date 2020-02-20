# DRI Functional Genomics Workshop

Material for the Functional Genomics Workshop 28/02/2020

This repository contains all the material regarding the Functional Genomics Workshop including:

* the material and the code of 5 of 6 Demos: DAPPLE, GONet, FUMA, PLN
* the slides:  `Workshop_Functional_Genomics_28_02_2019.pptx`

## DAPPLE: Protein-Protein Interactions Network

**Instructions** 

To use DAPPLE, you will use the GenePattern deployed on Amazon Cloud: https://cloud.genepattern.org/gp and to create your own account here: https://cloud.genepattern.org/gp/pages/registerUser.jsf

**Content** 

* `list_gene_symbol` is a set of genes: 146 genes that are mapped to genome-wide significant loci from common epilepsies Genome-Wide Association Study (PMID: 30531953, https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-018-07524-z/MediaObjects/41467_2018_7524_MOESM4_ESM.xlsx)
* The output by running DAPPLE with this list of genes.

## GoNet: Gene Ontology analysis

**Instructions**

To run GoNet, you will need to open this URL: https://tools.dice-database.org/GOnet/

**Content**

* `list_gene_symbol` a set of genes file: 146 genes that are mapped to genome-wide significant loci from common epilepsies Genome-Wide Association Study 
* output: network ouput under png and cytoscape format

## FUMA: Tissue expression analysis

**Instructions**

To run FUMA, you will need to open this URL https://fuma.ctglab.nl and to create an account here: https://fuma.ctglab.nl/register

**Content**

The repository include two examples:
* `list_gene_symbol`: 146 epilepsy risk genes with output (FUMA_gene2func35125.zip) resulting from GENE2FUNC 
* `scz_2018.tar.gz` SNP GWA association study summary stastistic from schizrophrenia case-control study (https://www.nature.com/articles/s41588-018-0059-2.pdf) with output (FUMA_job70399.zip) resulting from SNP2GENE

## Cytoscape: Complex networks visualisation

**Instructions**

To use Cytoscape, you need to download and install Cytoscape via this URL: https://cytoscape.org/download.html

**Content**

The repository include two examples:

* `sub_net_nervous_info_gene.txt` a gene sub-network of ~ 2500 genes build by using multiple of functional annotation (see section phenotypic linkage network)
* a cytoscape network:  `Costanzo_Science_2010.cys`


## PLN: Phenotypic Linkage Network

This directory included the a Rmarkdown,PLN_Demonstration_V1.Rmd to evaluate whether a given set of genes demonstrate unusually similar functionality. It examines the extent to which those genes cluster within the PLN. For this, it compares the sum of weighted links observed between these genes as compared to an equal number of random genes and computes an empirical p-value. As the
coding-sequence (CDS) length and the network connectivity (degree) can bias functional network
associations, the randomized genes are matched in CDS length and the degree to the original genes.

**Set up**

You will need to install a recent version of R (3.6.2) and Rstudio (version > 1.1.383)
You will need to have the following R packages installed: `biomaRt`,`ggplot2`,`igraph`,`DT`,`gridExtra`,`ggnetwork`,`network`
We will use the development versions of the Bioconductor packages.

```{r}
install.packages(c("ggplot2","igraph","DT","gridExtra","ggnetwork","network"))
## try http:// if https:// URLs are not supported
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("biomaRt")
```

**Download PLN dataset**

You will need to download the PLN dataset and the final PLN here:
https://drive.google.com/open?id=1wDFoldeFf8JjiWRhc2IjEtKhZ0nVtFwp


## References

* `DAPPLE publication`: Proteins Encoded in Genomic Regions Associated with Immune-Mediated Disease Physically Interact and Suggest Underlying Biology https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1001273

* `GOnet publication`: GOnet: a tool for interactive Gene Ontology analysis https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2533-3

* `FUMA publication`: Functional mapping and annotation of genetic associations with FUMA 
https://www.nature.com/articles/s41467-017-01261-5

* `Cytoscape publication`: Cytoscape: A Software Environment for Integrated Models of Biomolecular Interaction Networks
https://genome.cshlp.org/content/13/11/2498.long

* `PLN publication`: Unbiased Functional Clustering of Gene Variants with a Phenotypic-Linkage Network
https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003815

* `T2D PLN publication`: Diverse type 2 diabetes genetic risk factors functionally converge in a phenotype-focused gene network
https://journals.plos.org/ploscompbiol/article/figures?id=10.1371/journal.pcbi.1005816






