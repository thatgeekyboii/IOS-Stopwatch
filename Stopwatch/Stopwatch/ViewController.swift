//
//  ViewController.swift
//  Stopwatch
//
//  Created by Vaibhav Patil on 23/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    // Creating variables for the worling
    
    var timer = Timer()
    var isTimerRunning = false  //the timer doesn't run during the initial launch of the app
    
    var counter = 0.0
    
    
    
    @IBAction func resetDidTap(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    @IBAction func pauseDidTap(_ sender: Any) {
        
        
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    @IBAction func startDidTap(_ sender: Any) {
        
        if !isTimerRunning
        {
            timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            
            isTimerRunning = true
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        // Do any additional setup after loading the view.
    }


    @objc func runTimer()
    {
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        
        var minuteString = "\(minute)"
        if minute < 10
        {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        
        if second<10
        {
            secondString = ("0\(second)")
        }
        
        let decisecond = String(format: "%.1f",counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
    }
}

