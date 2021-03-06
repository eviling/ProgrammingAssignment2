## makeCacheMatrix Function: creates a special “matrix” object that can cache its inverse. 
# Contaning a list with: set the value of the matrix, get the value of the matrix, set the value of the inverse
# and, get the value of the inverse

## cacheSolve Function: computes the inverse of the special “matrix” returned by makeCacheMatrix

## This function creates a special “matrix” object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function computes the inverse of the special “matrix” returned by makeCacheMatrix above
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}

#EXAMPLE
a <- matrix(c(1,2,3,0,1,4,5,6,0), ncol = 3, byrow = T)
z <- makeCacheMatrix(a)
cacheSolve(z)

