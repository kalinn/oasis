% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oasis_predict.R
\name{oasis_predict}
\alias{oasis_predict}
\title{OASIS Prediction}
\usage{
oasis_predict(flair, t1, t2, pd, brain_mask = NULL, preproc = FALSE,
  normalize = TRUE, model = NULL, return_preproc = FALSE,
  binary = FALSE, threshold = 0.16, cores = 1)
}
\arguments{
\item{flair}{flair volume of class \code{\link{nifti}}}

\item{t1}{t1 volume of class \code{\link{nifti}}}

\item{t2}{t2 volume of class \code{\link{nifti}}}

\item{pd}{pd volume of class \code{\link{nifti}}}

\item{brain_mask}{brain mask of class \code{\link{nifti}}, 
if \code{NULL} a brain mask will be created using \code{\link{fslbet}}.  
Note that provided brain masks should be in the same space as the T1 volume 
if \code{preproc = TRUE}, as all volumes will be registered to this space}

\item{preproc}{is a logical value that determines whether to 
call \code{\link{oasis_preproc}} and performs the necessary preprocessing steps 
for OASIS}

\item{normalize}{is a logical value that determines whether to 
perform z-score normalization using \code{\link{zscore_img}} 
of the image over the brain mask, 
should be \code{TRUE} unless you train model
using an alternative normalization}

\item{model}{an object of class \code{\link{glm}} used to make the OASIS predictions}

\item{return_preproc}{is a logical value that indicates whether the 
preprocessed images should be returned, if \code{NULL} 
then the model from the OASIS paper will be used}

\item{binary}{logical indicating whether a binary map 
should be returned by thresholding the probability map}

\item{threshold}{numeric indicating the threshold value 
for the probability map, with default of 0.16 for the OASIS paper}

\item{cores}{numeric indicating the number of cores to be 
used (no more than 4 is useful for this software implementation)}
}
\value{
If \code{return_preproc = FALSE} the function returns a 
volume of class \code{\link{nifti}} containing the OASIS probability for each voxel. 
Otherwise, the function returns a list of volumes: 
the OASIS probability map, the FLAIR volume, the T1 volume, the T2 volume,
the PD volume, the brain mask for the subject, and the voxel selection mask.
}
\description{
This function creates the OASIS probability map from a single MRI study with FLAIR, T1, T2, and PD volumes.
}
\examples{
\dontrun{
library(fslr)
flair <- readnii('path/to/flair', reorient = FALSE) 
t2 <- readnii('path/to/t2', reorient = FALSE) 
t1 <- readnii('path/to/t1', reorient = FALSE) 
pd <- readnii('path/to/pd', reorient = FALSE) 
oasis_map <- oasis_predict(flair = flair, t1 = t1, t2 = t2, pd = pd) }
}

