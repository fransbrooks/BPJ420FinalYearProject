##Set working directory to where the output files for MyCarrierPlanInterpreter.java are
setwd("/home/frans/Documents/BPJ420/CarrierPlanInterpreter")

##RUNNING FIXED COSTS AND VARIABLE COSTS
##Read in the .csv file containing data about the fleet composition for running fixed costs and variable costs
FSMinfoRunFixAndVar <- read.csv("shipments_80_vehicleTypesFixedRunningAndVariablesumValues.csv")

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
FSMinfoVar <- read.csv("shipments_80_vehicleTypesOnlyVariablesumValues.csv")

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
FSMinfoRunFix <- read.csv("shipments_80_vehicleTypesOnlyFixedRunningsumValues.csv")

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
FSMinfoFixAndVar <- read.csv("shipments_80_vehicleTypesAbsFixAndVarsumValues.csv")

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
FSMinfoFix <- read.csv("shipments_80_vehicleTypesOnlyAbsFixsumValues.csv")

##Make Seperate tables for each type of truck for fixed cost only
FixThreeTonners <- FSMinfoFix[grep("truck_3",FSMinfoFixAndVar$vehId),]
FixSixTonners <- FSMinfoFix[grep("truck_6",FSMinfoFixAndVar$vehId),]
FixSevenTonners <- FSMinfoFix[grep("truck_7",FSMinfoFixAndVar$vehId),]
FixTwelveTonners <- FSMinfoFix[grep("truck_12",FSMinfoFixAndVar$vehId),]
FixFifteenTonners <- FSMinfoFix[grep("truck_15",FSMinfoFixAndVar$vehId),]

##Append the data for using fixed cost only to the TruckTotals data.frame
TruckTotals <- rbind(TruckTotals,c(length(FixThreeTonners$vehId),length(FixSixTonners$vehId),length(FixSevenTonners$vehId),length(FixTwelveTonners$vehId),length(FixFifteenTonners$vehId)))
rownames(TruckTotals) <- c("RunFixAndVar","VarOnly","RunFixOnly","FixAndVar","FixOnly")

##Barplots to show the fleet composition
setwd("/home/frans/Documents/BPJ420/Rplots")
pdf("RunFixAndVarFC.pdf")
barplot(TruckTotals["RunFixAndVar",],main= "Fleet Composition for Running-Fixed Cost and Variable Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
dev.off()
pdf("VarOnlyFC.pdf")
barplot(TruckTotals["VarOnly",],main= "Fleet Composition for Variable Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
dev.off()
pdf("RunFixOnlyFC.pdf")
barplot(TruckTotals["RunFixOnly",],main= "Fleet Composition for Running Fixed Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
dev.off()
pdf("FixAndVarFC.pdf")
barplot(TruckTotals["FixAndVar",],main= "Fleet Composition for Fixed and Variable Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
dev.off()
pdf("FixOnlyFC.pdf")
barplot(TruckTotals["FixOnly",],main= "Fleet Composition for Fixed Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
dev.off()
pdf("AllFC.pdf", width = 10, height = 10)
par(mfrow = c(3, 2))
barplot(TruckTotals["RunFixAndVar",],main= "Fleet Composition for Running-Fixed Cost and Variable Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
barplot(TruckTotals["VarOnly",],main= "Fleet Composition for Variable Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
barplot(TruckTotals["RunFixOnly",],main= "Fleet Composition for Running Fixed Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
barplot(TruckTotals["FixAndVar",],main= "Fleet Composition for Fixed and Variable Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
barplot(TruckTotals["FixOnly",],main= "Fleet Composition for Fixed Cost", ylim = c(0,12), col="lightblue")
axis(at = 1:12, side=2)
dev.off()

##Adding a new column which shows total number of vehicles for each cost scenario
TruckTotals <- cbind(TruckTotals, rowSums(TruckTotals))
CollumnNames <- c("3Tonners", "6Tonners", "7Tonners", "12Tonners", "15Tonners", "Total")
colnames(TruckTotals) <- CollumnNames

##Plot vehicle totals against one another
pdf("VehicleTotals.pdf")
barplot(TruckTotals[,"Total"], main= "Total Number of Vehicles in the Fleet for Various Cost Inputs", ylim=c(0,16), col="lightgoldenrodyellow")
axis(side=2, at=0:15)
dev.off()

##Generate LaTeX table Output
library(xtable)
xtable(TruckTotals)
