## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { #x exists in this enviroment (function)
        m <- NULL #m is the new matrix (object)
        set <- function(y) {
                x <<- y # '<<-' force the scope to the function
                m <<- NULL # Refresh the Matrix
        }
        get <- function() x #Return the value of the argument received  - method
        setsolve <- function(solve) m <<- solve #Set the new value - method
        getsolve <- function() m  #return the matrix - method 
        list(set=set, get=get, setsolve=setsolve, getsolve = getsolve) # Return the list and let call the methods by their name ($)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- x$getsolve() #to do that x needs the makeCacheMatrix "form"
        if(!is.null(m)) { #get the cache value
                message("getting solved matrix")
                return(m)
        }
        ## Return a matrix that is the inverse of 'x'
        data <- x$get() #to do that x needs the makeCacheMatrix "form"
        m <- solve(data, ...) #'solve' the matrix
        x$setsolve(m) #cache the 'solve' matrix
        m #return the value
}
