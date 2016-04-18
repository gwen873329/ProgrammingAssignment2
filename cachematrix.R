## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
		Inv <- NULL
		set <- function(y){
			x <<- y
			Inv <<-NULL
		}
		get <- function() x
		setInv <- function(Inverse) Inv <<- Inverse
		getInv <- function() Inv
		list(set=set, get=get
			 setInv=setInv, getInv=getInv)
}



## Write a short comment describing this function
##This function computes the inverse of the special "matrix" returned by the function "makeCacheMatrix" above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
        Inv <- x$getInv()
        if(!is.null(Inv)){
        				message("getting cached data")
        				return(Inv)
        	}
        data <-x$get()
        Inv <- inverse(data,...)
        x$setInv(Inv)
        Inv
}
