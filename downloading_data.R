#downloading data 

setwd("A:\\PhD\\R_Directory\\Routines\\")
dir.create("ReproducibleResearch")
setwd("A:\\PhD\\R_Directory\\Routines\\ReproducibleResearch")
list.files()
myURL<-"http://data.dft.gov.uk/gb-traffic-matrix/Traffic-major-roads-km.csv"

download.file(myURL, destfile="traffic.csv")
dateAccesed <- date()



con     <-url(myURL, open="r")
traffic <-read.csv(con)

head(traffic[1:3,1:7])

close(con)

install.packages("data.table")

require(data.table)

####fread is much quicker!!!!! than read.table

require(data.table)
bigData <- data.frame(x=rnorm(1e6), y=rnorm(1e6))

tempFile <- tempfile()

write.table(bigData, file=tempFile, row.names=FALSE, col.names=TRUE, 
            sep="\t", quote=FALSE)

system.time(fread(tempFile))

##    user  system elapsed 
##   0.482   0.000   0.483

system.time(read.table(tempFile, header=TRUE, sep="\t"))

##    user  system elapsed 
##   5.411   0.064   5.494
