#' Equate Multiple Groups
#' @description A function to apply \code{\link[SemNetCleaner]{equate}}
#' to multiple response matrices
#' 
#' @param ... Matrices or data frames.
#' Binary response matrices to be equated
#' 
#' @return This function returns a list containing the
#' equated binary response matrices in the order they were input.
#' The response matrices are labeled as the object name they were
#' entered with
#' 
#' @examples
#' # Toy example
#' raw <- open.animals[c(1:10),-c(1,2)]
#' 
#' # Clean and prepocess data
#' clean <- textcleaner(raw, partBY = "row", dictionary = "animals")
#' 
#' # Obtain binary data
#' bin <- clean$binary
#' 
#' # Finalize mat1
#' mat1 <- finalize(bin[c(1:5),])
#' 
#' # Finalize mat2
#' mat2 <- finalize(bin[c(6:10),])
#' 
#'
#' # Equate mat1 and mat1
#' eq <- equate.multi(mat1, mat2)
#' 
#' # Obtain respective equated response matrices
#' eq.mat1 <- eq$mat1
#' eq.mat2 <- eq$mat2
#' 
#' @author Alexander Christensen <alexpaulchristensen@gmail.com>
#' 
#' @export
equate.multi <- function(...)
{
    name <- as.character(substitute(list(...)))
    name <- name[-which(name=="list")]
    
    datalist <- list(...)
    
    len <- length(datalist)
    
    if(len>2)
    {
        first <- datalist[[1]]
        eq <- SemNetCleaner::equate(first,datalist[[2]])$rmatA
        
        for(i in 2:(len-1))
        {eq <- SemNetCleaner::equate(eq,datalist[[(i+1)]])$rmatA}
        
        finlist <- list()
        
        for(j in 1:len)
        {finlist[[name[j]]] <- equate(eq,datalist[[j]])$rmatB}
        
    }else if(len==2)
    {
        finlist <- equate(datalist[[1]],datalist[[2]])
        names(finlist) <- name
    }else{stop("Must be at least two datasets as input")}
    
    return(finlist)
}
#----