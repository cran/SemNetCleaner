#' Equate Group Responses
#' @description In general, this function serves as a wrapper for
#' \code{\link[SemNetCleaner]{equate.multi}}. This function equates the
#' responses between two binary response matrices (e.g., two groups)
#' by only keeping the column names that match between both matrices.
#' 
#' @param rmatA Binary matrix.
#' A \link[SemNetCleaner]{textcleaner} filtered response matrix
#' for binary matrix A
#' 
#' @param rmatB Binary matrix. 
#' A \link[SemNetCleaner]{textcleaner} filtered response matrix
#' for binary matrix B
#' 
#' @return A list containing binary matrices that have matching column
#' names (matching response):
#' 
#' \item{rmatA}{Binary matrix with matched responses for \code{rmatA}}
#' 
#' \item{rmatB}{Binary matrix with matched responses for \code{rmatB}}
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
#' eq <- equate(mat1, mat2)
#' 
#' # Obtain respective equated response matrices
#' eq.mat1 <- eq$mat1
#' eq.mat2 <- eq$mat2
#' 
#' @author Alexander Christensen <alexpaulchristensen@gmail.com>
#' 
#' @export
# Equate----
equate <- function (rmatA, rmatB)
{
    while(length(colnames(rmatA))!=length(colnames(rmatB)))
    {
        if(length(colnames(rmatA))>=length(colnames(rmatB)))
        {rmatA<-rmatA[,(!is.na(match(colnames(rmatA),colnames(rmatB))))]
        }else if(length(colnames(rmatB))>=length(colnames(rmatA)))
        {rmatB<-rmatB[,(!is.na(match(colnames(rmatB),colnames(rmatA))))]
        }else if(all(match(colnames(rmatA),colnames(rmatB))))
        {print("Responses match")}
    }
    
    return(list(rmatA=rmatA,rmatB=rmatB))
}
#----