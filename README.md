# Acoustic-Classification-Flow-Conditions-Stone-Movement-Mountain-Rivers-ml-e24752
In this repository, you will find the data augmentation codes, the classification codes for 5 models, CSV files extracted features, the audio files used for data augmentation, and some WAV audio samples. These files were used in the article “Acoustic Classification of Flow Conditions and Stone Movement in Mountain Rivers Using Machine Learning.”

There are 5 folders:
1. audio_files_to_increase_data: contains 8 audio files in WAV format used for data augmentation; by incorporating white noise and pink noise, these generate 10 files from each original file.
2. augmentation_codes: Python code for augmenting audio samples of low-flow water, high-flow river water, and rocks impacting surfaces.
3. augmented_audio_samples: contains 3 subfolders, each holding 33 WAV files—the result of augmenting the original files—for a total of 99 files.
4. classification-codes: contains code for classifying the audio samples, totaling 20 files: 4 files each for classification using a multilayer perceptron, logistic regression, random forest, support vector machines, and XGBoost. Each classification model is represented by 4 files, with each file processing a different number of top features (8, 12, 16, and 20) to develop the model.
5. estimate_features: MATLAB code for extracting classical features as well as the 11 proposed descriptors. It also includes code to plot the cumulative energy frequency percentage up to 700 Hz, with values ​​calculated for 70 Hz bins.
