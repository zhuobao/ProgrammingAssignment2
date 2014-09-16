## This script contains functions generating a set of functions (methods)
## cache (set) and fetch(get) user created matrix and the inverse matrix
## calculated using base::solve function.
##   The user generated matrix and calculated inverse matrix are stored in 
## "out-of-environment" variables.

## matrix set/get methods initialization function
## initialize four methods:
## 1, set the value of the user matrix (set)
## 2, get the value of the user matrix (get)
## 3, set the value of the inverse matrix (setivm)
## 4, get the value of the inverse matrix (getivm)

makeCacheMatrix <- function(x = matrix()) {
    ivm <-NULL
    set <- function(y=matrix()) {
        x <<- y
        ivm <<- NULL
    }
    get <- function() x
    setivm <- function(invmat) ivm <<- invmat
    getivm <- function() ivm
    list(set=set, get=get, setivm=setivm, getivm=getivm)
}


## calculate the inverse matrix that stored by "makeCacheMatrix" initialized 
## methods. When the inverse ha already been calculated, then the cacheSolve
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getivm()
    if(!is.null(m)) {
        message("getting cached data")
        return(n)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setivm(m)
    m
}
