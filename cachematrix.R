<<<<<<< HEAD
# makeCacheMatrix FUNCTION
#1. Creats a placeholder, object m which will store the inverse of my matrix later
#2. Assigns the value y to object x, and NULL to object iv (inverse of the matrix).  Both objects are  
#   super-assigned, so the 2 objects can be accessed by "makeCacheMatrix" and "cacheSolve" later. 
#   Also after an user changes the input matrix, function(y) would reset x by using the latest 
#   input matrix and resetting iv to NULL.
#3. An annoymous function is defined here to return the value of x
#4. A new function, IV is defined to set the inverse matrix to iv.  IV is super-assigned, so it can 
#   be called by the cacheSolve function later.
#5. A new function is defined here to return the inverse matrix
#6. "list" is created to return a vector that consists of all the previously defined functions


  makeCacheMatrix <- function( x = numeric()) {
   iv <- NULL 		#1
   set <- function(y){  #2
	x <<- y; 
	iv <<- NULL
   } 				
   get <- function() x  #3
   setIV <- function(IV) iv <<- IV  #4  
   getIV <- function() iv  #5
   list(set = set, get = get, setIV = setIV, getIV = getIV) #6
  }

#cachSolve FUNCTION

#7. x$getIV stores the inverse matrix, which is assigned to iv
#8. If there is an inverse matrix previously cached, and if
#   the inverse matrix hasn't been reset (e.g. No changes in	
#   input matrix), then the message ("getting cached inverse")
#   would appear and iv would retrieve the cached inverse, and
#   the cachSolve function would terminate here.
#9. If there is no cached inverse matrix, the user's input
#   matrix is assigned to data
#10.  The solve function is used to calculate the inverse
#	of the user's input matrix (i.e. data).  
#11.  The inverse is then assigned to x
#12.  Returning the inverse matrix

 cacheSolve <- function(x, ...) {
  iv <- x$getIV()		#7
  if(!is.null(iv)) {	#8
    message("getting cahced inverse")
    return(iv)
  }
  data <- x$get()		  #9
  iv <- solve(data, ...)  #10
  x$setIV(iv)		  #11
  return(iv)		  #12
 }



