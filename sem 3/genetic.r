data = read.csv("C:\\Users\\ABC\\Downloads\\genetic\\train.csv")
names(data)

head(data)

#removing irrelevant columns
drop.col <- c("Patient.Id","Patient.First.Name","Family.Name","Father.s.name","Institute.Name","Location.of.Institute","Place.of.birth")
data<-data[,!(names(data) %in% drop.col)]

#
str(data)
summary(data)
dim(data)




# convert all the chr rows to factors
data[sapply(data, is.character)] <- lapply(data[sapply(data, is.character)], as.factor)
str(data)

# missing data
lapply(data,function(x) { length(which(is.na(x)))})
#attach(data)

data1<- data[which(data$Status=='Alive'),]
lapply(data1,function(x) { length(which(is.na(x)))})

data2
length(which(is.na(data$Test.1)&is.na(data$Symptom.1)))
lapply(data2,function(x) { length(which(is.na(x)))})

data3 = na.omit(data)
dim(data3)
unique(data$Genes.in.mother.s.side)
unique(data$Inherited.from.father)
unique(data$Maternal.gene)
unique(data$Paternal.gene)
unique(data$Status)
unique(data$Respiratory.Rate..breaths.min.)
unique(data$Heart.Rate..rates.min)
unique(data$Parental.consent)
unique(data$Follow.up)
unique(data$Gender)
unique(data$Birth.asphyxia)
data$Birth.asphyxia[data$Birth.asphyxia=="No record"] = ""
data$Birth.asphyxia[data$Birth.asphyxia=="Not available"] = ""

unique(data$Autopsy.shows.birth.defect..if.applicable.)
data$Autopsy.shows.birth.defect..if.applicable.[data$Autopsy.shows.birth.defect..if.applicable.== "None"]="No"
data$Autopsy.shows.birth.defect..if.applicable.[data$Autopsy.shows.birth.defect..if.applicable.== "Not applicable"]=""

unique(data$Folic.acid.details..peri.conceptional.)
unique(data$H.O.serious.maternal.illness)
unique(data$H.O.radiation.exposure..x.ray.)
data$H.O.radiation.exposure..x.ray.[data$H.O.radiation.exposure..x.ray.== "Not applicable" | data$H.O.radiation.exposure..x.ray.== "-" ]=""

unique(data$H.O.substance.abuse)
data$H.O.substance.abuse[data$H.O.substance.abuse== "Not applicable" | data$H.O.substance.abuse== "-" ]=""

unique(data$Assisted.conception.IVF.ART)
unique(data$History.of.anomalies.in.previous.pregnancies)
unique(data$No..of.previous.abortion)
unique(data$Birth.defects)
unique(data$Blood.test.result)
unique(data$Genetic.Disorder)
unique(data$Disorder.Subclass)
ad









data[data$Inherited.from.father==""]
which(data$Inherited.from.father=="")

levels(data$Genes.in.mother.s.side)
levels(data$Inherited.from.father)
data$Inherited.from.father[data$Inherited.from.father==""]<- NA
data$Inherited.from.father==""
