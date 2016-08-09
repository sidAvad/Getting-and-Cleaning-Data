library(reshape)

X <- rbind(Xtrn,Xtest)
colnames(X) <- Xcolnames[,2]
y <- rbind(ytrn,ytest)
X1 <- cbind(y,X)
sub <- rbind(subtrn,subtest)
X2 <- cbind(sub,X1)
colnames(X2) <- append(c("subject","activity"),as.character(Xcolnames[,2]))
sel <- grep("mean|std",colnames(X2))
Xsel <- X2[,sel]
Xsel <- cbind(X2[,1:2],Xsel)
 
Xsel[Xsel[,2]==1,2] <- "WALKING"
Xsel[Xsel[,2]==2,2] <- "WALKING_UPSTAIRS"
Xsel[Xsel[,2]==3,2] <- "WALKING_DOWNSTAIRS"
Xsel[Xsel[,2]==4,2] <- "SITTING"
Xsel[Xsel[,2]==5,2] <- "STANDING"
Xsel[Xsel[,2]==6,2] <- "LAYING"


mdata <- melt(Xsel, id=c("subject","activity"))
subjmeans <- cast(mdata, subject+activity~variable, mean)