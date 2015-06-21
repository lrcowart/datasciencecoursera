## These functions create a matrix that can cache its inverse,
## and calculate or retrieve that inverse, respectively.

## This takes a matrix as an argument (using coercion if necessary),
## and returns a list containing the matrix, its inverse (if calculated),
## and functions to set and retrieve the inverse.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function takes a cache matrix object as an argument, and returns
## the inverse of the matrix. It first tries to retrieve the cached inverse.
## If it is unsuccessful, it calculates the inverse and stores it in the
## original argument before returning the inverse.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
