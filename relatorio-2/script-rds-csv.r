library("rio")

x <- import("data/censo.Rds")

# confirm identical
all.equal(x, check.attributes = FALSE)

export(x, "mtcars.csv")