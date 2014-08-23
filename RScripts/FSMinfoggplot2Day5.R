##Set working directory to where the output files for MyCarrierPlanInterpreter.java are
setwd("/home/frans/Documents/BPJ420/CarrierPlanInterpreter/Day5")

##Load ggplot2 package for plotting data 
library(ggplot2)

##Load xtable package to generate LaTeX code for tables
library(xtable)

##RUNNING-FIXED COSTS AND VARIABLE COSTS
##Read in the .csv file containing data about the fleet composition for running fixed costs and variable costs
FSMinfoRunFixAndVar <- read.csv("Day5_80_vehicleTypesFixedRunningAndVariablesumValues.csv")

##Make Seperate tables for each type of truck for running fixed costs and variable costs
RunFixAndVarThreeTonners <- FSMinfoRunFixAndVar[grep("truck_3",FSMinfoRunFixAndVar$vehId),]
RunFixAndVarSixTonners <- FSMinfoRunFixAndVar[grep("truck_6",FSMinfoRunFixAndVar$vehId),]
RunFixAndVarSevenTonners <- FSMinfoRunFixAndVar[grep("truck_7",FSMinfoRunFixAndVar$vehId),]
RunFixAndVarTwelveTonners <- FSMinfoRunFixAndVar[grep("truck_12",FSMinfoRunFixAndVar$vehId),]
RunFixAndVarFifteenTonners <- FSMinfoRunFixAndVar[grep("truck_15",FSMinfoRunFixAndVar$vehId),]

##Make a table indicating how many vehicles of each type was specified for running fixed costs and variable costs
CollumnNames <- c("3Tonners", "6Tonners", "7Tonners", "12Tonners", "15Tonners")
TruckTotals <- data.frame(matrix(nrow=0, ncol=5))
TruckTotals <- rbind(c(length(RunFixAndVarThreeTonners$vehId),length(RunFixAndVarSixTonners$vehId),length(RunFixAndVarSevenTonners$vehId),length(RunFixAndVarTwelveTonners$vehId),length(RunFixAndVarFifteenTonners$vehId)))
colnames(TruckTotals) <- CollumnNames
rownames(TruckTotals) <- "RunFixAndVar"

##VARIABLE COSTS ONLY
##Read in the .csv file containing data about the fleet composition for variable costs only
FSMinfoVar <- read.csv("Day5_80_vehicleTypesOnlyVariablesumValues.csv")

##Make Seperate tables for each type of truck for variable costs only
VarThreeTonners <- FSMinfoVar[grep("truck_3",FSMinfoVar$vehId),]
VarSixTonners <- FSMinfoVar[grep("truck_6",FSMinfoVar$vehId),]
VarSevenTonners <- FSMinfoVar[grep("truck_7",FSMinfoVar$vehId),]
VarTwelveTonners <- FSMinfoVar[grep("truck_12",FSMinfoVar$vehId),]
VarFifteenTonners <- FSMinfoVar[grep("truck_15",FSMinfoVar$vehId),]

##Append the data for using variable cost only to the TruckTotals data.frame
TruckTotals <- rbind(TruckTotals,c(length(VarThreeTonners$vehId),length(VarSixTonners$vehId),length(VarSevenTonners$vehId),length(VarTwelveTonners$vehId),length(VarFifteenTonners$vehId)))
rownames(TruckTotals) <- c("RunFixAndVar","VarOnly")


##RUNNING FIXED COSTS ONLY
##Read in the .csv file containing data about the fleet composition for running fixed cost only
FSMinfoRunFix <- read.csv("Day5_80_vehicleTypesOnlyFixedRunningsumValues.csv")

##Make Seperate tables for each type of truck for fixed cost only
RunFixThreeTonners <- FSMinfoRunFix[grep("truck_3",FSMinfoRunFix$vehId),]
RunFixSixTonners <- FSMinfoRunFix[grep("truck_6",FSMinfoRunFix$vehId),]
RunFixSevenTonners <- FSMinfoRunFix[grep("truck_7",FSMinfoRunFix$vehId),]
RunFixTwelveTonners <- FSMinfoRunFix[grep("truck_12",FSMinfoRunFix$vehId),]
RunFixFifteenTonners <- FSMinfoRunFix[grep("truck_15",FSMinfoRunFix$vehId),]

##Append the data for using variable cost only to the TruckTotals data.frame
TruckTotals <- rbind(TruckTotals,c(length(RunFixThreeTonners$vehId),length(RunFixSixTonners$vehId),length(RunFixSevenTonners$vehId),length(RunFixTwelveTonners$vehId),length(RunFixFifteenTonners$vehId)))
rownames(TruckTotals) <- c("RunFixAndVar","VarOnly","RunFixOnly")


##FIXED COSTS AND VARIABLE COSTS
##Read in the .csv file containing data about the fleet composition for fixed cost and variable cost
FSMinfoFixAndVar <- read.csv("Day5_80_vehicleTypesAbsFixAndVarsumValues.csv")

##Make Seperate tables for each type of truck for fixed and variable cost 
FixAndVarThreeTonners <- FSMinfoFixAndVar[grep("truck_3",FSMinfoFixAndVar$vehId),]
FixAndVarSixTonners <- FSMinfoFixAndVar[grep("truck_6",FSMinfoFixAndVar$vehId),]
FixAndVarSevenTonners <- FSMinfoFixAndVar[grep("truck_7",FSMinfoFixAndVar$vehId),]
FixAndVarTwelveTonners <- FSMinfoFixAndVar[grep("truck_12",FSMinfoFixAndVar$vehId),]
FixAndVarFifteenTonners <- FSMinfoFixAndVar[grep("truck_15",FSMinfoFixAndVar$vehId),]

##Append the data for using fixed and variable cost to the TruckTotals data.frame
TruckTotals <- rbind(TruckTotals,c(length(FixAndVarThreeTonners$vehId),length(FixAndVarSixTonners$vehId),length(FixAndVarSevenTonners$vehId),length(FixAndVarTwelveTonners$vehId),length(FixAndVarFifteenTonners$vehId)))
rownames(TruckTotals) <- c("RunFixAndVar","VarOnly","RunFixOnly","FixAndVar")

##FIXED COST ONLY
##Read in the .csv file containing data about the fleet composition for fixed cost only
FSMinfoFix <- read.csv("Day5_80_vehicleTypesOnlyAbsFixsumValues.csv")

##Make Seperate tables for each type of truck for fixed cost only
FixThreeTonners <- FSMinfoFix[grep("truck_3",FSMinfoFixAndVar$vehId),]
FixSixTonners <- FSMinfoFix[grep("truck_6",FSMinfoFixAndVar$vehId),]
FixSevenTonners <- FSMinfoFix[grep("truck_7",FSMinfoFixAndVar$vehId),]
FixTwelveTonners <- FSMinfoFix[grep("truck_12",FSMinfoFixAndVar$vehId),]
FixFifteenTonners <- FSMinfoFix[grep("truck_15",FSMinfoFixAndVar$vehId),]

##Append the data for using fixed cost only to the TruckTotals data.frame
TruckTotals <- rbind(TruckTotals,c(length(FixThreeTonners$vehId),length(FixSixTonners$vehId),length(FixSevenTonners$vehId),length(FixTwelveTonners$vehId),length(FixFifteenTonners$vehId)))
rownames(TruckTotals) <- c("Running-Fixed Cost and Variable Cost","Variable Cost","Running-Fixed Cost","Fixed and Variable Cost","Fixed Cost")

##Adding a new column which shows total number of vehicles for each cost scenario
TruckTotals <- cbind(TruckTotals, rowSums(TruckTotals))
CollumnNames <- c("3Tonners", "6Tonners", "7Tonners", "12Tonners", "15Tonners", "Total")
colnames(TruckTotals) <- CollumnNames

##Plot fleet composition for running-fixed cost and variable cost with ggplot2 Package
x <- CollumnNames
x <- as.character(x)
x <- factor(x, levels=unique(x))
y <- TruckTotals[1,]
ggplotData <- data.frame(x,y)
g <- ggplot(data = ggplotData, aes(x=x,y=y)) + geom_bar(stat="identity") + xlab("Truck Type") + ylab("Number of Trucks") 
g <- g + theme_bw(base_size = 14) + ggtitle("Fleet Composition for Running-Fixed Cost \nand Variable Cost") 
g1 <- g + coord_cartesian(ylim=c(0, 5)) + scale_y_continuous(breaks=seq(0, 5, 1))
setwd("/home/frans/Documents/BPJ420/Rplots/Day5")
pdf("RunFixAndVar.pdf")
print(g1)
dev.off()

#Plot specific vehicles against the number of activities performed by each vehicle for running-fixed cost and variable cost
x <- FSMinfoRunFixAndVar$vehId
y <- FSMinfoRunFixAndVar$numOfAct
ActivityData <- data.frame(x,y)
g <- ggplot(data = ActivityData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Number of Activities")
gA1 <- g + ggtitle("Running-Fixed Cost and Variable Cost \nTotal Number of Activities per Vehicle") + theme_bw(base_size = 14) 
gA1 <- gA1 + coord_cartesian(ylim=c(0, 100)) + scale_y_continuous(breaks=seq(0, 100, 25))
pdf("VehicleActivitiesRunFixAndVar.pdf")
print(gA1)
dev.off()


#Plot specific vehicles against the distance travelled for each vehicle for running-fixed and variable cost
x <- FSMinfoRunFixAndVar$vehId
y <- FSMinfoRunFixAndVar$totDist
y <- y/1000 ##Convert y from meters to kilometers
DistanceData <- data.frame(x,y)
g <- ggplot(data = DistanceData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Total Distance Travelled (in km)")
gD1 <- g + ggtitle("Running-Fixed Cost and Variable Cost \nTotal Distance Travelled per Vehicle") + theme_bw(base_size = 14)
gD1 <- gD1 + coord_cartesian(ylim=c(0, 450)) + scale_y_continuous(breaks=seq(0, 450, 50))
pdf("VehicleDistanceRunFixAndVar.pdf")
print(gD1)
dev.off()

##Plot fleet composition for variable cost with ggplot2 Package
x <- CollumnNames
x <- as.character(x)
x <- factor(x, levels=unique(x))
y <- TruckTotals[2,]
ggplotData <- data.frame(x,y)
g <- ggplot(data = ggplotData, aes(x=x,y=y)) + geom_bar(stat="identity") + xlab("Truck Type") + ylab("Number of Trucks") 
g <- g + theme_bw(base_size = 14) + ggtitle("Fleet Composition for Variable Cost") 
g2 <- g + coord_cartesian(ylim=c(0, 5)) + scale_y_continuous(breaks=seq(0, 5, 1))
pdf("Var.pdf")
print(g2)
dev.off()

#Plot specific vehicles against the number of activities performed by each vehicle for variable cost
x <- FSMinfoVar$vehId
y <- FSMinfoVar$numOfAct
ActivityData <- data.frame(x,y)
g <- ggplot(data = ActivityData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Number of Activities")
gA2 <- g + ggtitle("Variable Cost \nTotal Number of Activities per Vehicle") + theme_bw(base_size = 14)
gA2 <- gA2 + coord_cartesian(ylim=c(0, 100)) + scale_y_continuous(breaks=seq(0, 100, 25))
pdf("VehicleActivitiesVar.pdf")
print(gA2)
dev.off()


#Plot specific vehicles against the distance travelled for each vehicle for variable cost
x <- FSMinfoVar$vehId
y <- FSMinfoVar$totDist
y <- y/1000 ##Convert y from meters to kilometers
DistanceData <- data.frame(x,y)
g <- ggplot(data = DistanceData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Total Distance Travelled (in km)")
gD2 <- g + ggtitle("Variable Cost \nTotal Distance Travelled per Vehicle") + theme_bw(base_size = 14)
gD2 <- gD2 + coord_cartesian(ylim=c(0, 450)) + scale_y_continuous(breaks=seq(0, 450, 50))
pdf("VehicleDistanceVar.pdf")
print(gD2)
dev.off()

##Plot fleet composition for running-fixed cost with ggplot2 Package
x <- CollumnNames
x <- as.character(x)
x <- factor(x, levels=unique(x))
y <- TruckTotals[3,]
ggplotData <- data.frame(x,y)
g <- ggplot(data = ggplotData, aes(x=x,y=y)) + geom_bar(stat="identity") + xlab("Truck Type") + ylab("Number of Trucks") 
g <- g + theme_bw(base_size = 14) + ggtitle("Fleet Composition for Running-Fixed Cost") 
g3 <- g + coord_cartesian(ylim=c(0, 5)) + scale_y_continuous(breaks=seq(0, 5, 1))
pdf("RunFix.pdf")
print(g3)
dev.off()

#Plot specific vehicles against the number of activities performed by each vehicle for running-fixed cost
x <- FSMinfoRunFix$vehId
y <- FSMinfoRunFix$numOfAct
ActivityData <- data.frame(x,y)
g <- ggplot(data = ActivityData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Number of Activities")
gA3 <- g + ggtitle("Running-Fixed Cost \nTotal Number of Activities per Vehicle") + theme_bw(base_size = 14)
gA3 <- gA3 + coord_cartesian(ylim=c(0, 100)) + scale_y_continuous(breaks=seq(0, 100, 25))
pdf("VehicleActivitiesRunFix.pdf")
print(gA3)
dev.off()


#Plot specific vehicles against the distance travelled for each vehicle for running-fixed cost
x <- FSMinfoRunFix$vehId
y <- FSMinfoRunFix$totDist
y <- y/1000 ##Convert y from meters to kilometers
DistanceData <- data.frame(x,y)
g <- ggplot(data = DistanceData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Total Distance Travelled (in km)")
gD3 <- g + ggtitle("Running-Fixed Cost \nTotal Distance Travelled per Vehicle") + theme_bw(base_size = 14)
gD3 <- gD3 + coord_cartesian(ylim=c(0, 450)) + scale_y_continuous(breaks=seq(0, 450, 50))
pdf("VehicleDistanceRunFix.pdf")
print(gD3)
dev.off()

##Plot fleet composition for fixed and variable cost with ggplot2 Package
x <- CollumnNames
x <- as.character(x)
x <- factor(x, levels=unique(x))
y <- TruckTotals[4,]
ggplotData <- data.frame(x,y)
g <- ggplot(data = ggplotData, aes(x=x,y=y)) + geom_bar(stat="identity") + xlab("Truck Type") + ylab("Number of Trucks") 
g <- g + theme_bw(base_size = 14) + ggtitle("Fleet Composition for Fixed and Variable Cost") 
g4 <- g + coord_cartesian(ylim=c(0, 5)) + scale_y_continuous(breaks=seq(0, 5, 1))
pdf("FixVar.pdf")
print(g4)
dev.off()

#Plot specific vehicles against the number of activities performed by each vehicle for fixed and variable cost
x <- FSMinfoFixAndVar$vehId
y <- FSMinfoFixAndVar$numOfAct
ActivityData <- data.frame(x,y)
g <- ggplot(data = ActivityData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Number of Activities")
gA4 <- g + ggtitle("Fixed and Variable Cost \nTotal Number of Activities per Vehicle") + theme_bw(base_size = 14)
gA4 <- gA4 + coord_cartesian(ylim=c(0, 100)) + scale_y_continuous(breaks=seq(0, 100, 25))
pdf("VehicleActivitiesFixAndVar.pdf")
print(gA4)
dev.off()


#Plot specific vehicles against the distance travelled for each vehicle for fixed and variable cost
x <- FSMinfoFixAndVar$vehId
y <- FSMinfoFixAndVar$totDist
y <- y/1000 ##Convert y from meters to kilometers
DistanceData <- data.frame(x,y)
g <- ggplot(data = DistanceData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Total Distance Travelled (in km)")
gD4 <- g + ggtitle("Fixed and Variable Cost \nTotal Distance Travelled per Vehicle") + theme_bw(base_size = 14)
gD4 <- gD4 + coord_cartesian(ylim=c(0, 450)) + scale_y_continuous(breaks=seq(0, 450, 50))
pdf("VehicleDistanceFixAndVar.pdf")
print(gD4)
dev.off()

##Plot fleet composition for fixed cost with ggplot2 package
x <- CollumnNames
x <- as.character(x)
x <- factor(x, levels=unique(x))
y <- TruckTotals[5,]
ggplotData <- data.frame(x,y)
g <- ggplot(data = ggplotData, aes(x=x,y=y)) + geom_bar(stat="identity") + xlab("Truck Type") + ylab("Number of Trucks") 
g <- g + theme_bw(base_size = 14) + ggtitle("Fleet Composition for Fixed Cost") 
g5 <- g + coord_cartesian(ylim=c(0, 5)) + scale_y_continuous(breaks=seq(0, 5, 1))
pdf("Fix.pdf")
print(g5)
dev.off()

#Plot specific vehicles against the number of activities performed by each vehicle for fixed cost
x <- FSMinfoFix$vehId
y <- FSMinfoFix$numOfAct
ActivityData <- data.frame(x,y)
g <- ggplot(data = ActivityData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Number of Activities")
gA5 <- g + ggtitle("Fixed Cost \nTotal Number of Activities per Vehicle") + theme_bw(base_size = 14)
gA5 <- gA5 + coord_cartesian(ylim=c(0, 100)) + scale_y_continuous(breaks=seq(0, 100, 25))
pdf("VehicleActivitiesFix.pdf")
print(gA5)
dev.off()


#Plot specific vehicles against the distance travelled for each vehicle for fixed cost
x <- FSMinfoFix$vehId
y <- FSMinfoFix$totDist
y <- y/1000 ##Convert y from meters to kilometers
DistanceData <- data.frame(x,y)
g <- ggplot(data = DistanceData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Vehicle") +ylab("Total Distance Travelled (in km)")
gD5 <- g + ggtitle("Fixed Cost \nTotal Distance Travelled per Vehicle") + theme_bw(base_size = 14)
gD5 <- gD5 + coord_cartesian(ylim=c(0, 450)) + scale_y_continuous(breaks=seq(0, 450, 50))
pdf("VehicleDistanceFix.pdf")
print(gD5)
dev.off()

##Plot total fleet size for each cost parameter with ggplot2 package
x <- rownames(TruckTotals)
y <- TruckTotals[,6]
ggplotData <- data.frame(x,y)
g <- ggplot(data = ggplotData, aes(x=x,y=y)) + geom_bar(stat="identity") + xlab("Cost Parameters Used As Input") + ylab("Total Number of Trucks") 
g <- g + theme_bw(base_size = 14) + ggtitle("Total Fleet Size") 
g6 <- g + coord_cartesian(ylim=c(0, 5)) + scale_y_continuous(breaks=seq(0, 5, 1))
pdf("FCTotals.pdf", width = 15)
print(g6)
dev.off()

##Define multiplot Function

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
        require(grid)
        
        # Make a list from the ... arguments and plotlist
        plots <- c(list(...), plotlist)
        
        numPlots = length(plots)
        
        # If layout is NULL, then use 'cols' to determine layout
        if (is.null(layout)) {
                # Make the panel
                # ncol: Number of columns of plots
                # nrow: Number of rows needed, calculated from # of cols
                layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                                 ncol = cols, nrow = ceiling(numPlots/cols))
        }
        
        if (numPlots==1) {
                print(plots[[1]])
                
        } else {
                # Set up the page
                grid.newpage()
                pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
                
                # Make each plot, in the correct location
                for (i in 1:numPlots) {
                        # Get the i,j matrix positions of the regions that contain this subplot
                        matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
                        
                        print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                                        layout.pos.col = matchidx$col))
                }
        }
}

##Plot fleet compositions for different cost input parameters
pdf("allplots.pfd", width = 12, height = 12)
multiplot(g1,g2,g3,g4,g5, cols=2)
dev.off()

##Plot activities per vehicle for different cost parameters
pdf("allActivities.pdf", width = 12, height = 12)
multiplot(gA1,gA2,gA3,gA4,gA5, cols=2)
dev.off()

##Plot distance travelled per vehicle for different cost parameters
pdf("allDistances.pdf", width = 12, height = 12)
multiplot(gD1,gD2,gD3,gD4,gD5, cols=2)
dev.off()

##Plot total cost for each model run
x <- c("Fixed Cost", "Fixed and Variable Cost", "Running-Fixed Cost", "Running-Fixed Cost and Variable Cost", "Variable Cost")
y <- c(FSMinfoFix$score[1]/100, FSMinfoFixAndVar$score[1]/100, FSMinfoRunFix$score[1]/100, FSMinfoRunFixAndVar$score[1]/100, FSMinfoVar$score[1]/100)*-1
TotCostData <- data.frame(x,y)
g <- ggplot(data = TotCostData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Cost Input Parameters") +ylab("Cost (in R)")
g <- g + theme_bw(base_size = 14) + ggtitle("Total Cost") 
pdf("TotalCosts.pdf", width = 13, height = 9)
print(g)
dev.off()

##Plot total distance travelled for each set of cost parameters
x <- c("Fixed Cost", "Fixed and Variable Cost", "Running-Fixed Cost", "Running-Fixed Cost and Variable Cost", "Variable Cost")
y <- c(sum(FSMinfoFix$totDist)/1000, sum(FSMinfoFixAndVar$totDist)/1000, sum(FSMinfoRunFix$totDist)/1000, sum(FSMinfoRunFixAndVar$totDist)/1000, sum(FSMinfoVar$totDist)/1000)
TotDistData <- data.frame(x,y)
g <- ggplot(data = TotDistData, aes(x=x, y=y)) + geom_bar(stat="identity") +xlab("Cost Parameters") + ylab("Total Distance (in km)")
g <- g + theme_bw(base_size = 14) + ggtitle("Total Distance") 
pdf("TotalDistance.pdf", width = 13)
print(g)
dev.off()
##Generate LaTeX code for Fleet Composition and Total Costs 

xtable(TruckTotals)
xtable(TotCostData)


