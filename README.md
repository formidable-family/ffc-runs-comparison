# Comparison of runs for "Humans in the Loop"

This repository contains R and shell scripts for comparing results produced for the paper "Humans in the Loop" across repeated runs. The comparison is for the purpose of verifying computational reproducibility. It contains the prediction files, but NOT the intermediate data files, which are to be compared.

The repository compares:

- Two identical sets of runs (ffc-test-run-1 and ffc-test-run-2) performed in March 2018
- Two identical sets of runs (ffc-test-run-3 and ffc-test-run-4) performed in August 2018

The two sets of runs are **NOT** identical to each other, and this repository attempts to explore why and to what extent that is the case.

## Practically identical predictions

Each set of runs contains 25 predictions. Of these, 21 do not match exactly (i.e., to 16 decimal places) between March and August. However, these match within the level of tolerance generally used in R to determine whether two sets of numbers are equal.

R's `all.equal` function has a `tolerance` argument for numerical comparison. The default tolerance is `sqrt(.Machine$double.eps)`, which is to 8 decimal places.

These 21 predictions match within this tolerance. This can be seen in the `compare.R` script. The `compare.sh` shows that the numbers do not match exactly.

## Amelia-based predictions

The remaining 4 predictions were produced using the Amelia package's version of multiple imputation. These contain larger differences between the March and August sets of runs.

This is not due to a change in Amelia version from 1.7.4 to 1.7.5, but may be due to differences in other package versions (including Amelia dependencies), or to changes in R itself. It is not due to hidden randomness in Amelia's imputation process, because the intermediate data sets and their predictions are exactly identical within each pair of runs.
