# PitchPerfect
Pitch Perfect is the first required ground-up app in the Udacity iOS Developer Nanodegree. I built it using the scripting language Swift and the Xcode IDE.

Basic description:

The initial view conbtroller transitions to a recordSoundsViewController.

The app asks the user for a sound recording, which the app captures with AVFoundation protocols.

Upon a successful file creation, the local file address is passed to the next view controller, PlaySoundsViewController, as a URL.

Inside PlaySoundsViewController, the user is next offered a series of six buttons which play back the previously recorded audio file with digital effect enhancements using the AVAudioPlayerDelegate protocol. 

Once an effect buttonm is pressed and playback begins, the user may end playback at any time by pressing the small Stop button at the bottom of the screen.

The Back button returns the user to the RecordSioundsViewController and requests another audio sample. 
