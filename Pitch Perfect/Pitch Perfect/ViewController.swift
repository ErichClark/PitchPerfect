//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Erich Clark on 2/23/18.
//  Copyright © 2018 Erich Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) { // From "Record" button
        print("The record button has been pressed.")
        recordingLabel.text = "Recording has started."
    }
    
    @IBAction func stopButton(_ sender: Any) { // From "Stop"
        print("The stop button was pressed.")
        recordingLabel.text = "Tap to record"
    }
}

