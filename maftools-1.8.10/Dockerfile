FROM ubuntu:16.04

MAINTAINER Stephen M. Kelly

# ~~~~~ BASIC SETUP ~~~~~ #
RUN apt-get update && \
apt-get install -y wget \
bzip2 \
make \
libcurl4-gnutls-dev \
libxml2-dev \
gcc \
g++ \
git \
zlib1g-dev \
libgit2-dev \
libssl-dev \
gfortran

# ~~~~~ MINICONDA ~~~~~ #
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh && \
bash Miniconda3-4.4.10-Linux-x86_64.sh -b -p /conda && \
rm -f Miniconda3-4.4.10-Linux-x86_64.sh
ENV PATH="/conda/bin:${PATH}"
RUN conda config --add channels defaults && \
conda config --add channels conda-forge && \
conda config --add channels bioconda && \
conda config --add channels r

# ~~~~~ R ~~~~~ #
RUN conda install -c conda-forge -c r -c bioconda \
r=3.5.1 \
r-base=3.5.1 \
r-essentials=3.5.1 \
bioconductor-complexheatmap=1.18.1 \
bioconductor-variantannotation=1.26.1 \
bioconductor-biostrings=2.48.0 \
r-biocmanager=1.30.4 \
r-bibtex=0.4.2 \
r-pkgmaker=0.27 \
r-registry=0.5 \
r-rngtools=1.3.1 \
r-gridbase=0.4_7 \
r-doparallel=1.0.11 \
r-cowplot=0.9.3 \
r-cometexacttest=0.1.5 \
r-nmf=0.21.0 \
r-ggrepel=0.8.0 \
r-mclust=5.4.1 \
r-wordcloud=2.5 \
r-gridextra=2.3

RUN echo 'BiocManager::install("maftools", version="3.8", update=FALSE)' | R --vanilla

# > library('maftools'); sessionInfo()
# R version 3.5.1 (2018-07-02)
# Platform: x86_64-conda_cos6-linux-gnu (64-bit)
# Running under: Ubuntu 16.04.5 LTS
#
# Matrix products: default
# BLAS/LAPACK: /conda/lib/R/lib/libRblas.so
#
# locale:
# [1] C
#
# attached base packages:
# [1] parallel  stats     graphics  grDevices utils     datasets  methods
# [8] base
#
# other attached packages:
# [1] maftools_1.8.0      Biobase_2.40.0      BiocGenerics_0.26.0
#
# loaded via a namespace (and not attached):
#  [1] splines_3.5.1               foreach_1.4.4
#  [3] assertthat_0.2.0            stats4_3.5.1
#  [5] BSgenome_1.48.0             GenomeInfoDbData_1.1.0
#  [7] Rsamtools_1.32.3            slam_0.1-43
#  [9] ggrepel_0.8.0               pillar_1.3.1
# [11] lattice_0.20-38             glue_1.3.0
# [13] digest_0.6.18               GenomicRanges_1.32.7
# [15] RColorBrewer_1.1-2          XVector_0.20.0
# [17] colorspace_1.3-2            cowplot_0.9.3
# [19] Matrix_1.2-15               plyr_1.8.4
# [21] XML_3.98-1.16               pkgconfig_2.0.2
# [23] bibtex_0.4.2                GetoptLong_0.1.7
# [25] zlibbioc_1.26.0             purrr_0.2.5
# [27] xtable_1.8-3                scales_1.0.0
# [29] BiocParallel_1.14.2         tibble_2.0.0
# [31] pkgmaker_0.27               IRanges_2.14.12
# [33] ggplot2_3.1.0               withr_2.1.2
# [35] SummarizedExperiment_1.10.1 lazyeval_0.2.1
# [37] survival_2.43-3             magrittr_1.5
# [39] crayon_1.3.4                mclust_5.4.1
# [41] doParallel_1.0.11           NMF_0.21.0
# [43] tools_3.5.1                 registry_0.5
# [45] data.table_1.11.8           GlobalOptions_0.1.0
# [47] matrixStats_0.54.0          gridBase_0.4-7
# [49] ComplexHeatmap_1.18.1       stringr_1.3.1
# [51] S4Vectors_0.18.3            munsell_0.5.0
# [53] cluster_2.0.7-1             rngtools_1.3.1
# [55] DelayedArray_0.6.6          bindrcpp_0.2.2
# [57] Biostrings_2.48.0           compiler_3.5.1
# [59] GenomeInfoDb_1.16.0         rlang_0.3.0.1
# [61] grid_3.5.1                  RCurl_1.95-4.11
# [63] iterators_1.0.10            rjson_0.2.20
# [65] circlize_0.4.5              bitops_1.0-6
# [67] gtable_0.2.0                codetools_0.2-16
# [69] reshape2_1.4.3              R6_2.3.0
# [71] GenomicAlignments_1.16.0    gridExtra_2.3
# [73] dplyr_0.7.8                 rtracklayer_1.40.6
# [75] bindr_0.1.1                 shape_1.4.4
# [77] stringi_1.2.4               Rcpp_1.0.0
# [79] wordcloud_2.5               tidyselect_0.2.5
# Package    Version
# AnnotationDbi     1.42.1
#      BH   1.66.0-1
# BSgenome     1.48.0
# Biobase     2.40.0
# BiocGenerics     0.26.0
# BiocManager     1.30.4
# BiocParallel     1.14.2
# BiocVersion      3.8.0
# Biostrings     2.48.0
# ComplexHeatmap     1.18.1
#     DBI      1.0.0
# DelayedArray      0.6.6
# GenomeInfoDb     1.16.0
# GenomeInfoDbData      1.1.0
# GenomicAlignments     1.16.0
# GenomicFeatures     1.32.3
# GenomicRanges     1.32.7
# GetoptLong      0.1.7
# GlobalOptions      0.1.0
# IRanges    2.14.12
# IRdisplay      0.7.0
# IRkernel     0.8.14
# KernSmooth    2.23-15
# ModelMetrics      1.1.0
#     NMF     0.21.0
#      R6      2.3.0
# RColorBrewer      1.1-2
#   RCurl  1.95-4.11
# RSQLite      2.1.1
#    Rcpp      1.0.0
# RcppRoll      0.3.0
# Rsamtools     1.32.3
# S4Vectors     0.18.3
# SQUAREM  2017.10-1
# SummarizedExperiment     1.10.1
#     TTR     0.23-4
# VariantAnnotation     1.26.1
#     XML  3.98-1.16
# XVector     0.20.0
# assertthat      0.2.0
# backports      1.1.3
# base64enc      0.1-3
#  bibtex      0.4.2
#   bindr      0.1.1
# bindrcpp      0.2.2
# biomaRt     2.36.1
#     bit     1.1-12
#   bit64      0.9-7
#  bitops      1.0-6
#    blob      1.1.1
#    boot     1.3-20
#   broom      0.5.1
#   callr      3.1.1
#   caret     6.0-81
# cellranger      1.1.0
# circlize      0.4.5
#     cli      1.0.1
#   clipr      0.4.1
# cluster    2.0.7-1
# colorspace      1.3-2
# cometExactTest      0.1.5
# cowplot      0.9.3
#  crayon      1.3.4
#    curl        3.2
# data.table     1.11.8
#  dbplyr      1.3.0
#  digest     0.6.18
# doParallel     1.0.11
#   dplyr      0.7.8
# evaluate       0.12
#   fansi      0.4.0
# forcats      0.3.0
# foreach      1.4.4
# formatR        1.5
#      fs      1.2.6
# futile.logger      1.4.3
# futile.options      1.0.1
# generics      0.0.2
# ggplot2      3.1.0
# ggrepel      0.8.0
#   gistr      0.4.2
#  glmnet     2.0-16
#    glue      1.3.0
#   gower      0.1.2
# gridBase      0.4-7
# gridExtra        2.3
#  gtable      0.2.0
#   haven      2.0.0
#  hexbin     1.27.2
#   highr        0.7
#     hms      0.4.2
# htmltools      0.3.6
# htmlwidgets        1.3
#  httpuv    1.4.5.1
#    httr      1.4.0
#   ipred      0.9-8
# iterators     1.0.10
# jsonlite        1.6
#   knitr       1.21
# labeling        0.3
# lambda.r      1.2.3
#   later      0.7.5
#    lava      1.6.4
# lazyeval      0.2.1
# lubridate      1.7.4
# maftools      1.8.0
# magrittr        1.5
#    maps      3.3.0
# markdown        0.9
# matrixStats     0.54.0
#  mclust      5.4.1
# memoise      1.1.0
#    mime        0.6
#  modelr      0.1.2
# munsell      0.5.0
# numDeriv   2016.8-1
# openssl        1.1
#  pbdZMQ      0.3-3
#  pillar      1.3.1
# pkgconfig      2.0.2
# pkgmaker       0.27
#   plogr      0.2.0
#    plyr      1.8.4
# prettyunits      1.0.2
# processx      3.2.1
# prodlim 2018.04.18
# progress      1.2.0
# promises      1.0.1
#    pryr      0.1.4
#      ps      1.3.0
#   purrr      0.2.5
# quantmod     0.4-13
# randomForest     4.6-14
#  rbokeh      0.5.0
#   readr      1.3.1
#  readxl      1.2.0
# recipes      0.1.4
# registry        0.5
# rematch      1.0.1
#    repr     0.19.1
#  reprex      0.2.1
# reshape2      1.4.3
#   rjson     0.2.20
#   rlang    0.3.0.1
# rmarkdown       1.11
# rngtools      1.3.1
#   rpart     4.1-13
# rprojroot      1.3-2
# rstudioapi        0.8
# rtracklayer     1.40.6
#   rvest      0.3.2
#  scales      1.0.0
# selectr      0.4-1
#   shape      1.4.4
#   shiny      1.2.0
#    slam     0.1-43
#    snow      0.4-3
# sourcetools      0.1.7
# spatial     7.3-11
# stringi      1.2.4
# stringr      1.3.1
#  tibble      2.0.0
#   tidyr      0.8.2
# tidyselect      0.2.5
# tidyverse      1.2.1
# timeDate   3043.102
# tinytex        0.9
#    utf8      1.1.4
#    uuid      0.1-2
# viridisLite      0.3.0
# whisker      0.3-2
#   withr      2.1.2
# wordcloud        2.5
#    xfun        0.4
#    xml2      1.2.0
#  xtable      1.8-3
#     xts     0.11-1
#    yaml      2.2.0
# zlibbioc     1.26.0
#     zoo      1.8-4
# > ip <- as.data.frame(installed.packages()[,c(1,3:4)]); rownames(ip) <- NULL; ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]; print(ip, row.names=FALSE)
