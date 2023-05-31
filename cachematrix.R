## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# set input x as a matrix --> then solved value "inv" as a null variable

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL             #set inverse to be null
set <- function(y){
  x <<- y
  inv <<- NULL
}
get <- function() x     # function to get matrix x
set_inverse <- function(inverse) inv <<- inverse
get_inverse <- function() inv # function to get inverse
list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}

# this creates a matrix object that can cache its inverse 

## Write a short comment describing this function
# creates an inverse of the matrix returned by makeCacheMatrix
## if the inverse has already been computed - then this function
## will retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$get_inverse()
  if(!is.null(inv)){       # check that inverse is actually null
    message("getting cached data :)")
    return(inv)            # return inverse value
  }
  data <- x$get()
  inv <- solve(data)       # calculate inverse value
  x$set_inverse(inv)
  inv                      # return the matrix with inverse of x
}
