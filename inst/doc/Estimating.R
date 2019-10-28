## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----Combine scores with binary matrix, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Attach 'Group' variable to the binary response matrix
#  behav <- cbind(open.animals$Group, corr.clean$binary)
#  # Create low and high openness to experience response matrices
#  low <- behav[which(behav[,1]==1),-1]
#  high <- behav[which(behav[,1]==2),-1]

## ----Save binary, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Save binary response matrices
#  write.csv(low, "low_BRM.csv", row.names = TRUE)
#  write.csv(high, "high_BRM.csv", row.names = TRUE)

## ----Finalize groups, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Finalize matrices so that each response
#  # has been given by at least two participants
#  final.low <- finalize(low, minCase = 2)
#  final.high <- finalize(high, minCase = 2)

## ----Equate groups, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Equate the responses across the networks
#  eq <- equate(final.low, final.high)
#  equate.low <- eq$final.low
#  equate.high <- eq$final.high

## ----Compute similarity, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Compute cosine similarity for the 'low' and
#  # 'high' equated binary response matrices
#  cosine.low <- similarity(equate.low, method = "cosine")
#  cosine.high <- similarity(equate.high, method = "cosine")

## ----Estimate networks, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Estimate 'low' and 'high' openness to experience networks
#  net.low <- TMFG(cosine.low)$A
#  net.high <- TMFG(cosine.high)$A

## ----Save the networks, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Save the networks
#  write.csv(net.low, "network_low.csv", row.names = FALSE)
#  write.csv(net.high, "network_high.csv", row.names = FALSE)

## ----Binarize networks, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Binarize the networks (optional)
#  net.low <- binarize(net.low)
#  net.high <- binarize(net.high)

