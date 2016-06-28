## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix(), inv = NULL) {
    
    set <- function(y) {x <<- y}
    get <- function() {x}
    
    setInverse <- function(z) {inv <<- z} 
    getInverse <- function(){inv}
    
    list( #the above written functions could be directly store here!!
        set = set
        ,get = get
        ,setInverse = setInverse
        ,getInverse = getInverse
    )
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    #needs cached sqaure matrix as an argument 
    ##...means that it can more arguments for nested functions e.g. na.rm =TRUE can passed
    inv <- x$getInverse()
    
    if(!is.null(inv)){
        message("getting the cached inverse of matrix")
        return(inv)
    } else {
        data <- x$get()
        inv <- solve(data, ...) 
        x$setInverse(inv) #optional but should be included if we intend to cache the matrix
        return (inv)  
    }
    
}
