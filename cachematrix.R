## Matrix inversion is usually a costly computation and there may be some benefit
## to caching the inverse of a matrix rather than compute it repeatedly. The
## following two functions are used to cache the inverse of a matrix.

## First learn what an inverse matrix is by visiting
## https://www.mathsisfun.com/algebra/matrix-inverse.html

## makeCacheMatrix - This function creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    myinv <- NULL
    set <- function(y) {
        x <<- y
        myinv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) myinv <<- inverse
    getinverse <- function() myinv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# cacheSolve - This function returns the inverse of the matrix. First, it checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix can always be inverted.

cacheSolve <- function(x, ...) {
    myinv <- x$getinverse()
    if(!is.null(myinv)) {
        message("Pulling from cached data. Yowsa!!!")
        return(myinv)
    }
    data <- x$get()
    myinv <- solve(data)
    x$setinverse(myinv)
    myinv
}