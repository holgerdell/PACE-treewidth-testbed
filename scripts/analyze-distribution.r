#! /usr/bin/env Rscript
d<-scan("stdin", quiet=TRUE)
cat("min    = ", min(d), "\n")
cat("max    = ", max(d), "\n")
cat("median = ", median(d), "\n")
cat("mean   = ", mean(d), "\n")
cat("sd     = ", sd(d), "\n")
