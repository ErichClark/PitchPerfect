//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Erich Clark on 2/23/18.
//  Copyright © 2018 Erich Clark. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    // MARK: outlets
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    // MARK: Configures UI for recording
    
    func configureUIforRecording(readyToRecord: Bool){
        if !readyToRecord {
            recordingLabel.text = "Recording in progress"
            stopRecordingButton.isEnabled = true
            recordButton.isEnabled = false
        } else if readyToRecord {
            recordingLabel.text = "Tap to record"
            stopRecordingButton.isEnabled = false
            recordButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIforRecording(readyToRecord: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: recordAudio function
    
    @IBAction func recordAudio(_ sender: Any) { // From "Record" button
        configureUIforRecording(readyToRecord: false)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        print("Recording started at:")
        printTimeStamp()
    }
    
    // MARK: stopRecording function
    
    @IBAction func stopRecording(_ sender: Any) { // From "Stop" button
        configureUIforRecording(readyToRecord: true)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    // MARK: Ends recording, passes URL to next VC via segue
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
            print("Recording saved at:")
            printTimeStamp()
        } else {
            print("Recording was unsucessful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = (recordedAudioURL as NSURL!) as URL!
        }
    }
    
    // Mark: printTime debugger function
    
    func printTimeStamp() {
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        formatter.string(from: currentDateTime)
        
        // get the date time String from the date object
        let timeStamp = formatter.string(from: currentDateTime) // October 8, 2016 at 10:48:53 PM
        print(timeStamp)
    }

}

