## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix will create a list of functions which can be used to cache the inverse of a matrix.

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  list(
    
      # get - return the matrix
      get = function() { 
        x 
      },
      # set - set the value of the matrix
      set = function(y) {
        x <<- y
        inv = NULL
      },
      # getInv - gets the cached value of the inverse
      getInv = function() { 
        inv
      },
      # setInv - sets the cache
      setInv = function(inverse) {
        inv <<- inverse
      }
    )
}


## cacheSolve will take a CacheMatrix object from the above function and return the 
##  inverse of the matrix. It will only solve the matrix the first time and return the cached
##  version thereafter
##
## If the matrix is not solvable it will return an error

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getInv()
    if(is.null(i)){
      message("not cached, setting cache")
      x$setInv(solve(x$get()))
    }
    x$getInv()
}
