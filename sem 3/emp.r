data = read.csv("C:\\Users\\ABC\\Downloads\\employee\\Employee.csv")
names(data)
str(data)
dim(data)

# missing data
lapply(data,function(x) { length(which(is.na(x)))})

# preprocessing
data[sapply(data, is.character)] <- lapply(data[sapply(data, is.character)], as.factor)
data$PaymentTier <- as.factor(data$PaymentTier)
data$LeaveOrNot <- as.factor(data$LeaveOrNot)

str(data)

lapply(data,function(x) {levels(x)})

#LeaveorNot: WHETHER EMPLOYEE LEAVES THE COMPANY IN NEXT 2 YEARS
#PAYMENT TIER: 1: HIGHEST 2: MID LEVEL 3:LOWEST
#EverBenched: EVER KEPT OUT OF PROJECTS FOR 1 MONTH OR MORE

tabl <- table(data$LeaveOrNot)
tabl

prop.table(tabl)

tabl <- table(data$Education)
tabl
prop.table(tabl)

barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))

tabl <- table(data$Education,data$LeaveOrNot)
tabl
prop.table(tabl,margin=1)
prop.table(tabl,margin=2)
barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))

tabl <- table(data$City)
tabl
prop.table(tabl)

tabl <- table(data$City,data$LeaveOrNot)
tabl
prop.table(tabl,margin=1)
prop.table(tabl,margin=2)
barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))


tabl <- table(data$PaymentTier)
tabl
prop.table(tabl)

tabl <- table(data$PaymentTier,data$LeaveOrNot)
tabl
prop.table(tabl,margin=1)
prop.table(tabl,margin=2)
barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))

tabl <- table(data$Gender)
tabl
prop.table(tabl)

tabl <- table(data$Gender,data$LeaveOrNot)
tabl
prop.table(tabl,margin=1)
prop.table(tabl,margin=2)
barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))

tabl <- table(data$EverBenched)
tabl
prop.table(tabl)

tabl <- table(data$EverBenched,data$LeaveOrNot)
tabl
prop.table(tabl,margin=1)
prop.table(tabl,margin=2)
barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))

tabl <- table(data$ExperienceInCurrentDomain)
tabl
prop.table(tabl)

tabl <- table(data$ExperienceInCurrentDomain,data$LeaveOrNot)
tabl
prop.table(tabl,margin=1)
prop.table(tabl,margin=2)
barplot(t(tabl))
barplot(t(prop.table(tabl,margin=1)))

model.log = glm(LeaveOrNot~.-LeaveOrNot,data = data,family = 'binomial')
summary(model.log)
