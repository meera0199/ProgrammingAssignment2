## These functions introduce a special matrix object which caches the inverse of said matrix

makeCacheMatrix <- function(x = matrix()) { # a function that creates the special matrix object that can cache its inverse
 inv <- NULL
 set <- function(y){ # defines function to set the value of the matrix
        x <<- y # sets the value
        inv <<- NULL # clears the cache
 }

 get <- function() x # defines function to get the value of the matrix
 setInv <- function(inverse) inv <<- inverse # defines function to set the inverse.
 getInv <- function() inv # defines function to get the inverse.
 list(set = set, get = get, setInv = setInv, getInv = getInv) # returns a list with the four functions
}


cacheSolve <- function(x, ...) # a function that computes the inverse of the matrix x
inv <- x$getInv()
if(!is.null(inv)){ # if the cache is not empty then we return it 
        message("getting cached result")
	return(inv)
}

data <- x$get() # if the cache was not empty, we need to calculate the inverse, cache the result and return it
inv <- solve(data, ...)
x$setInv(inv) # cache the result of the calculation of the inverse
inv #return the inverse              
       
## Return a matrix that is the inverse of 'x'
}
