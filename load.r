# Said Muñoz Montero - said3427@gmail.com
## Loading ballgown package
## I installed the package using conda, the command is in Code.sh script
library(ballgown)

## Load Liver results
bgLiver <- ballgown(samples="liver")
## Load Brain results
bgBrain <- ballgown(samples="brain")

## extract transcript-level expression measurements for Liver and Brain samples
LiverTranscripts <- texpr(bgLiver)
BrainTranscripts <- texpr(bgBrain)

## Writing the first 1000 lines in CSV
write.csv(head(LiverTranscripts,1000),file="results/LiverTranscripts.csv")
write.csv(head(BrainTranscripts,1000),file="results/BrainTranscripts.csv")

## Finally, saving the Rdata object
save(bgLiver,bgBrain, file='results/DataBallgown.rda')
