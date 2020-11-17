#!/bin/zsh
source ~/.zshrc
# Do the V4 predictions on a directory.

# Enter in the foil name.
FOILNAME=I1008
# Enter the name of the directory containing jpg images.  It must be in the directory you want as a subdir "jpgs"
JPGDIR=/home/zack/SAH/$FOILNAME/jpgs
# Enter in the file name you want for the produced predictions.
PREDICTIONNAME=${FOILNAME}_V4_predictions

conda activate tf1x

python 030-384x512Predict.py --PredictDir $JPGDIR --PredictionsOutputFile $JPGDIR/../$PREDICTIONNAME.txt 

python 031-MakeViewPredictionsHTML.py --PredictionsFile $JPGDIR/../$PREDICTIONNAME.txt --PredictionsFileHTML $JPGDIR/../$PREDICTIONNAME.html --RelativePath jpgs 

python 031-MakeViewPredictionsHTML.py --PredictionsFile $JPGDIR/../$PREDICTIONNAME.txt --PredictionsFileHTML $JPGDIR/../${PREDICTIONNAME}_Cutoff_0.1.html --RelativePath jpgs --CutoffValue 0.1

