getValRange <- function(x, hilo) {
  ifelse(hilo %in% unlist(dimnames(x)), x["text",hilo][[1]], NA)
}

out <- apply(zresults_list, MAR=2, function(property) {
  zpid <- property$zpid
  links <- unlist(property$links)
  address <- unlist(property$address)
  z <- property$zestimate
  zestdf <- list(
    amount=ifelse("text" %in% names(z$amount), z$amount$text, NA),
    lastupdated=z$"last-updated",
    valueChange=ifelse(length(z$valueChange)==0, NA, z$valueChange),
    valueLow=getValRange(z$valuationRange, "low"),
    valueHigh=getValRange(z$valuationRange, "high"),
    percentile=z$percentile)  
  list(id=zpid, links, address, zestdf)
})
