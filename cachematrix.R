## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## 1. This is creating a special "matrix" object that will allow it to cache its inverse

makeCacheMatrix = function(x = matrix()) {
        iv = NULL
        set = function(y) {
                x <<- y
                iv <<- NULL
        }
        get = function() x
        setiv = function(inverse) iv <<- inverse
        getiv = function() iv
        list(set = set, get = get,
             setiv = setiv,
             getiv = getiv)

}


## 2. Write a short comment describing this function
## This function is computing the inverse of the special "matrix" from makeCacheMatrix. Assuming
## no changes in the matrix, if the inverse has been calculated, it will retreive it from the cache


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        iv = x$getiv()
        if(!is.null(iv)){
                message("gettting cached data")
                return(iv)
        }
        data = x$get()
        iv = solve(data, ...)
        x$setiv(iv)
        iv
}
