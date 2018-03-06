# PitchPerfect
Pitch Perfect is the first required ground-up app in the Udacity iOS Developer Nanodegree. I built it using the scripting language Swift and the Xcode IDE.

Basic description:

The initial view controller transitions to a RecordSoundsViewController.

The app asks the user for a sound recording, which it captures with AVFoundation protocols. Clicking a microphone icon button starts the recording, and clicking a square-type stop button icon stops recording and saves the file.

Upon successful file creation, RecordSoundsViewController passes the local file address via URL to the next view controller, PlaySoundsViewController.

Inside PlaySoundsViewController, the user is offered a series of six buttons which play back the previously recorded audio file with digital effect enhancements using the AVAudioPlayerDelegate protocol. 

Once an effect button is pressed and playback begins, the user may end playback at any time by pressing the small Stop button at the bottom of the screen.

The Back button returns the user to the RecordSoundsViewController where the user may record another audio sample.
