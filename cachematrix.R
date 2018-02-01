## The functions here will help to create/retreive a cached Matrix and also save/get its inverse

# Below functon will help to create a Matrix and save it in Cache, it also has methods to save and retrieve the inverse to the cache. 
# These methods will be used by the cacheSolve function to set/get the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The cacheSolve function can check if the inverse of the matrix is present in the cache, if yes it is fetched 
## from cache and returned else it will calculate the inverse save it in the cache and return the inverse

cacheSolve <- function(x, ...) {
        
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
