#--------------------------------------------
# Advanced R technical session---------------
# Chapter 2: Names & Values -----------------
#--------------------------------------------

# load packages
library(lobstr)

# 1. Exercises

#  a. Difference between objects
a <- 1:10
b <- a
c <- b
d <- 1:10


# ANSWER
list_of_names <- list(a, b, c, d)
obj_addrs(list_of_names)




#  b. Do these functions point to the same function object?
mean
base::mean
get("mean")
evalq(mean)
match.fun("mean")

# ANSWER
mean_functions <- list(
  mean,
  base::mean,
  get("mean"),
  evalq(mean),
  match.fun("mean")
)

unique(obj_addrs(mean_functions))







#  c. By default, base R data import functions,
#      like read.csv(), will automatically convert
#      non-syntactic names to syntactic ones.
#      Why might this be problematic? What option
#      allows you to suppress this behaviour?

# ANSWER

# Column names are often data, and the underlying make.names() transformation is non-invertible,
# so the default behaviour corrupts data. To avoid this, set check.names = FALSE.


#  d. What rules does make.names() use to convert
#      non-syntactic names into syntactic ones?


# ANSWER
make.names("")
make.names(".1")
make.names("non-valid")
make.names("@")
make.names("  R")

#  e. I slightly simplified the rules that govern
#     syntactic names. Why is .123e1 not a syntactic name?
#     Read `?make.names` for the full details.

# ANSWER
make.names("if")

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


# 2. Exercises

# a. Why is `tracemem(1:10)` not useful?


# ANSWER



# b. Explain why tracemem() shows two copies when you run this code
x <- c(1L, 2L, 3L)
tracemem(x)
x[[3]] <- 4L
untracemem(x)
# ANSWER
# integer changed to double
x <- c(1L, 2L, 3L)
tracemem(x)
x[[3]] <- 4L
untracemem(x)

# c. Sketch out the relationship between the following objects:
a <- 1:10
b <- list(a, a)
c <- list(b, a, 1:10)

# d. What happens when you run this code?
x <- list(1:10)
x[[2]] <- x
x


#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


# 3. Exercises

# a. In the following example, why are object.size(y) and obj_size(y)
#   so radically different? Consult the documentation of object.size().
y <- rep(list(runif(1e4)), 100)
object.size(y)
#> 8005648 bytes
obj_size(y)
#> 80,896 B

# b. Take the following list. Why is its size somewhat misleading?
funs <- list(mean, sd, var)
obj_size(funs)
#> 17,608 B
obj_size(funs$mean)

# c. Predict the output of the following code:
a <- runif(1e6)
obj_size(a)

b <- list(a, a)
obj_size(b)
obj_size(a, b)

b[[1]][[1]] <- 10
obj_size(b)
obj_size(a, b)

b[[2]][[1]] <- 10
obj_size(b)
obj_size(a, b)


# 4. Exercises

# a. Explain why the following code doesn’t create a circular list.
x <- list()
x[[1]] <- x
x

# b. Wrap the two methods for subtracting medians into two functions,
#    then use the ‘bench’ package17 to carefully compare their speeds.
#    How does performance change as the number of columns increase?

# c. What happens if you attempt to use tracemem() on an environment?



