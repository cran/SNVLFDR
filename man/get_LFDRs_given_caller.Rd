% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Source.R
\name{get_LFDRs_given_caller}
\alias{get_LFDRs_given_caller}
\title{Estimates LFDR values per mutant site detected by a desired variant caller}
\usage{
get_LFDRs_given_caller(bam_input, calls, LFDR.T, error)
}
\arguments{
\item{bam_input}{Path to an original BAM file used to call variants. The file must be in the format of a csv file generated by bam-readcount (https://github.com/genome/bam-readcount). See Examples.}

\item{calls}{Path to a vcf file generated by a variant caller. The first and second columns of this file have to be CHR names and positions, respectively.}

\item{LFDR.T}{A number between 0 and 1. It can be set to 0 to include all sites. Otherwise, this threshold excludes sites with an LFDR below the specified threshold.  If no value is specified, it will be set to 0.01 by default.}

\item{error}{Error rate between 0 and 1. If it is set to NULL, a weighted average of average base call quality and average mapping quality per site will be calculated. Otherwise, it may be set to 0.01 or a desired error vector can be introduced by the user.}
}
\value{
A list. Slot \strong{estimated.LFDRs} returns estimated LFDRs for all sites in the input file.
Slot \strong{updated.bam} adds estimated LFDRs, model errors and a mutant variable (indicating whether each site is detected to be a mutant (1) or non-mutant (0) site) to the input bam file.
}
\description{
Based on a given read count matrix and a list of calls made by a desired variant caller, estimates LFDRs that corresponds to each genomic site. It further
classifies sites to either mutant or non-mutant sites by comparing their estimated LFDRs with an LFDR cut-off value. The cut-off value as well as error rates can be defined by users.
}
\examples{
bam_path <- system.file("extdata", "bam_input.csv", package="SNVLFDR")
calls_path <- system.file("extdata", "calls.vcf", package="SNVLFDR")
output=get_LFDRs_given_caller(bam_input=bam_path,calls=calls_path,LFDR.T=0.01,error=NULL)

}
\references{
Karimnezhad, A. and Perkins, T.J. (2024). Empirical Bayes single nucleotide variant calling for next-generation sequencing data. Scientific Reports 14,  1550, <doi:10.1038/s41598-024-51958-z>
}
