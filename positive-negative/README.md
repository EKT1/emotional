This SVM model uses prosody features to detect the positive/neutral/negative attitude from speech.
Features are extracted with the OpenSmile program `SMILEextract`.
The training set is calculated from the *EKI spontaneous speech corpus* (567 sentences from 4 speakers).

The detection process can be started by issuing the command:
```
  ./run.sh
```
This presumes a working `SMILEextract` installation.

SMILEextract is using ithe `portaudio` for managing audio devices.
To list available input devices use:

```
  ./run.sh -listDevices 1
```

To run with non default device (ex. 2):
```
  ./run.sh -device 2
```


### Files

Feature sets:
 - np.lsvm   - all feature vectors
 - np-test.lsvm  - test set 
 - nptrain.lsvm - training set

The files of the SVM model generated from the trainig set:

 - np-train.lsvm.model
 - np-train.lsvm.range

`SMILEextract` configuration files:

 - extract.ini - configuration file for feature extraction from the WAV files 
 - detect.ini  - configuration for running the detection process using the microphone. Microphone level should be adjusted for proper turn detection.

Common configuration files used by `detect.ini` and `extract.ini`:

 - wave.ini
 - prosody.ini
 - functionals.ini
 - classes.txt

Images for the SVM classification results visualization:

 - images/

Scripts:

 - install.sh - create a link to SMILExtract plugins
 - svm.sh   - create SVM model. It assume the LibSVM is installed at ../libsvm
 - run.sh   - run SMILEextract with configuration from detect.ini

