
# The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
# 1.set the matrix
# 2.get the matrix
# 3.set the inverse matrix
# 4.get the inverse matrix


makeCacheMatrix <- function(x = matrix()) {  # definition of the function makeCacheMatrix, the input is a matrix called x
  m <- NULL
 # as in the example "Caching the Mean of a Vector", we are going to build four functions
  set <- function(y) {  # the first function sets the value of the matrix
    x <<- y
    m <<- NULL
  }
  get <- function() x  # the second function gets the value of the matrix
  setinverse <- function(solve) m <<- solve  # the third function sets the inverse of the matrix (the inverse is obtained thanks to the solve function)
  getinverse <- function() m # and then the last function gets the value of the inverse matrix
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) #the output is a list containing these four functions
}


# The following function calculates the inverse of the special "matrix" created with the above function. 
# However, it first checks to see if the inverse has already been calculated. (1)
# If so, it gets the inverse from the cache and skips the computation. (2)
# Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  #(1)&(2)
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #(3)
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  #Output
  m
}



