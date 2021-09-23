# Random sampling

## Coin toss sample space
install.packages('prob')
library(prob)

# single time
tosscoin(1)
?tosscoin 
## this basically generates the sample space of coin toss given number of times
tosscoin(4)
tosscoin(4,TRUE)
tosscoin(15)

## sample space of die roll
rolldie(1)
rolldie(5)
## this grows very fast in number

## die of n-sides:
rolldie(3, nsides = 5)

# deck of cards
head(cards())
?cards
cards()

## roullete
roulette()
?roulette

## sampling from an urn

### this is one of the most basic sampling from which other can be sort of derived 
### by changing inputs.

?urnsamples
# arguments - urnsamples(x, size. replace = FALSE,ordered=FALSE)

urnsamples(1:5,3)
urnsamples(1:5,3,replace = TRUE)
urnsamples(1:5,3,replace = TRUE, order = TRUE)
urnsamples(1:5,3,order = TRUE)

## order = True gives the permutations

urnsamples(c('Red','Red','Red','Blue','Blue','Black'),2,replace = FALSE)
urnsamples(c('Red','Red','Red','Blue','Blue','Black'),2,replace = FALSE, order = TRUE)

## here note that there are 4 red red combinations. This is because this function treats the balls as
## distinguishable. urnsamples behaves as if each ball in the urn is distinguishable, regardless of its actual contents. 
## We may thus imagine that while there are two red balls in the urn, the balls are such that we can tell them
## apart (in principle) by looking closely enough at the imperfections on their surface.

## same thing applies for replace also.


## Probabilities
 
## the makespace agrument gives the probabilities of each of the element
tosscoin(3, makespace = TRUE)
rolldie(3, makespace = TRUE)


## Now, finding out the probabilities that we need
S<-tosscoin(3, makespace = TRUE)

## all the ones where first toss is a head
S[c(which(S[1]=='H')),]

# total probability
sum(S[c(which(S[1]=='H')),]$probs)

##
S<-cards()
subset(S,rank %in% 4:5)

subset(rolldie(3,makespace = TRUE), X1 + X2 + X3 > 16)

## subsets can get increasingly complex. This is handled with two functions
## 1. %in%
## 2. isin()

x <- 1:10
y <- 8:12

y %in% x

subset(S, isin(S,c('H','H')))
