
# **********
# Big data set was generated with R using the code
apu <- rakennukset[1:2000,1:30]     # NOTE: range 1:30 necessary, not 1:1
a2 <- apu@polygons
b2 <- list(1:length(a2))
for (i in 1:length(a2)) {b2[[i]] <- apu@polygons[[i]]@Polygons[[1]]@coords}
c2 <- b2
for (i in 1:length(apu)) {c2[[i]][,1] <- 6371000*b2[[i]][,1]*pi/180
+ c2[[i]][,2] <- 6371000*log(tan(pi/4 + 0.5*b2[[i]][,2]*pi/180))
+ }
#
#
# NOTE: direction of unit vector changed
#
#
s <- 1
up <- 2*(lentot-length(c2))
d2 <- list(1:up)
for (i in 1:length(c2)) { veclen <- dim(c2[[i]])[1]
+     for (j in 1:(veclen-1)) { 
+     	ulength <- sqrt((c2[[i]][j,1] - c2[[i]][j+1,1])^2 + (c2[[i]][j,2] - c2[[i]][j+1,2])^2)
+ 	npoints <- 2*floor(ulength)+1
+ 	uvecx <- (c2[[i]][j,1] - c2[[i]][j+1,1])
+ 	uvecy <- (c2[[i]][j,2] - c2[[i]][j+1,2])
+ 	apumatrix <- matrix(0,npoints+1,2)
+ 		  for (v in 0:npoints) {
+ 		      apumatrix[v+1,1] <- c2[[i]][j,1] - v*uvecx/(npoints+1)
+ 		      apumatrix[v+1,2] <- c2[[i]][j,2] - v*uvecy/(npoints+1)
+ 		      		       }
+ 		      d2[[s]] <- apumatrix
+ 		      s <- s+1
+ 		      d2[[s]] <- matrix((c2[[i]][j,1] + uvecx),(c2[[i]][j,2] + uvecy),nrow=1,ncol=2)
+ 		      s <- s+1
+ } }
#
s <- 1; pcount <- 0*c(1:(lentot-length(c2))); for (i in 1:length(c2)) { veclen <- dim(c2[[i]])[1]; for (j in 1:(veclen-1)) {ulength <- sqrt((c2[[i]][j,1] - c2[[i]][j+1,1])^2 + (c2[[i]][j,2] - c2[[i]][j+1,2])^2); npoints <- 2*floor(ulength) + 1; pcount[[s]] <- npoints; s <- s+1 } }
#
n <- sum(pcount+1) + (lentot-length(c2)) + 1000
s <- 1
allpoints <- matrix(0,n,2)
for (i in 1:length(d2)) { 
+     for (j in 1:dim(d2[[i]])[1]) { 
+     	allpoints[s,1] <- d2[[i]][j,1]
+     	allpoints[s,2] <- d2[[i]][j,2]
+ 	s <- s+1
+ } }
#
lentot <- 0; for (i in 1:length(c2)) { veclen <- dim(c2[[i]])[1]; lentot <- lentot + veclen }
#
## Try rearranging now part of the program given above
#
s <- 1; pcount <- 0*c(1:(lentot-length(c2))); for (i in 1:length(c2)) { veclen <- dim(c2[[i]])[1]; for (j in 1:(veclen-1)) {ulength <- sqrt((c2[[i]][j,1] - c2[[i]][j+1,1])^2 + (c2[[i]][j,2] - c2[[i]][j+1,2])^2); npoints <- 2*floor(ulength) + 1; pcount[[s]] <- npoints; s <- s+1 } }
#
n <- sum(pcount+1) + (lentot-length(c2)) + 1000
s <- 1
#
bcount <- vector(length = length(c2)+1); bcount[1] <- 0; for ( i in 2:(length(c2)+1) ) {bcount[i] <- bcount[i-1] + dim(c2[[i-1]])[1] - 1}
#
allpoints <- matrix(0,n,3)
for (i in 1:length(d2)) { 
+     for (j in 1:dim(d2[[i]])[1]) { 
+     	allpoints[s,1] <- d2[[i]][j,1]
+     	allpoints[s,2] <- d2[[i]][j,2]
+ 	#
+ 	a <- min(which(i <= 2*bcount))  # a marks the position of a single
+ 	     		    		# building
+     	allpoints[s,3] <- apu@data$I_KERRLKM[a-1]
+ 	s <- s+1
+ } }
#
#
# NOTE: The part below is taken from
#
allpoints3 <- subset(allpoints, allpoints[,2] > 8428000 & allpoints[,1] > 2774000)
#
allpoints2 <- allpoints3; n <- dim(allpoints3)[1]; for (i in 1:n) {
+ allpoints2[i,1] <- allpoints3[i,1] - 2388481
+ # (2388482 = max(allpoints3[,1]) - max(laserdata2[,1]))
+ #
+ allpoints2[i,2] <- allpoints3[i,2] - 1756612
+ # (1756612 = max(allpoints3[,2]) - max(laserdata2[,2]))
+ # In other words, we match the maximum values of laserdata2 and allpoints2
+ }
# Writing results into a file allpoints3D.txt
#
write(t(allpoints2), file="allpoints3Dbig.txt", ncolumns=3)
# **********



