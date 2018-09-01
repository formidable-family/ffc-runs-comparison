library(readr)
library(dplyr)
library(purrr)

## compare imputed data ----
## NOTE: commented out, because this data can't be put online
# run1 <- read_rds("ffc-test-run-1/ffc-humans-in-the-loop/data/imputed/imputed-fulldata-lasso.rds")
# run3 <- read_rds("ffc-test-run-3/ffc-humans-in-the-loop/data/imputed/imputed-fulldata-lasso.rds")
# 
# all_equal(run1, run3, ignore_row_order = FALSE)
# 
# all.equal(run1, run3)
# 
# tail(run1$hv4a20)
# tail(run3$hv4a20)
# head(run1$ffcc_famsurvey_a7_a4)
# head(run3$ffcc_famsurvey_a7_a4)
# 
# compare_cols <- map2_dfc(run1, run3, all.equal)

## two columns have small differences in them
## the rest all match
# unique(t(compare_cols))

## compare imputations from Amelia ----
## NOTE: commented out, because this data can't be put online
# mi1 <- read_rds("ffc-test-run-1/ffc-humans-in-the-loop/data/imputed/background_ffvars_amelia.rds")
# 
# mi3 <- read_rds("ffc-test-run-3/ffc-humans-in-the-loop/data/imputed/background_ffvars_amelia.rds")
# mi4 <- read_rds("ffc-test-run-4/ffc-humans-in-the-loop/data/imputed/background_ffvars_amelia.rds")
# 
# compare_mi <- map2_dfc(mi1$imputations$imp1, mi4$imputations$imp1, all.equal)
# compare_mi_new <- map2_dfc(mi3$imputations$imp1, mi4$imputations$imp1, all.equal)
# 
## most columns have some differences...
# length(unique(t(compare_mi)))
# length(unique(t(compare_mi_new)))


# compare predictions ----

files1 <- list.files("ffc-test-run-1/ffc-humans-in-the-loop/output/predictions/", 
                     pattern = "prediction.csv", 
                     recursive = TRUE, 
                     full.names = TRUE)

names1 <- list.files("ffc-test-run-1/ffc-humans-in-the-loop/output/predictions")[1:25]

pred1 <- read_csv(files1[5])

files3 <- list.files("ffc-test-run-3/ffc-humans-in-the-loop/output/predictions/", 
                     pattern = "prediction.csv", 
                     recursive = TRUE, 
                     full.names = TRUE)

names3 <- list.files("ffc-test-run-3/ffc-humans-in-the-loop/output/predictions")[1:25]

files4 <- list.files("ffc-test-run-4/ffc-humans-in-the-loop/output/predictions/", 
                     pattern = "prediction.csv", 
                     recursive = TRUE, 
                     full.names = TRUE)


pred3 <- read_csv(files3[5])

all.equal(pred1, pred3)

all_equal(pred1, pred3)

print(tail(pred1$gpa), digits = 22)
print(tail(pred3$gpa), digits = 22)

all.equal(pred1$gpa, pred3$gpa)

all.equal(pred1, pred3)

map2_dfc(pred1, pred3, all.equal)

compare_predictions <- function(f1, f2) {
  pred1 <- read_csv(f1)
  pred2 <- read_csv(f2)
  map2_dfc(pred1, pred2, all.equal)
}

differences <- map2(files1, files3, compare_predictions)
names(differences) <- names1

differences
# most differences are within the default tolerance of `all.equal`
# BUT there are higher mean relative differences for the Amelia imputations

differences_new <- map2(files3, files4, compare_predictions)
names(differences_new) <- names3

differences_new
# there are no differences
