//
//  TimerViewController.swift
//  Timer
//
//  Created by Diego Aguirre on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Properties
    var timer = Timer()
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursPickerView: UIPickerView!
    @IBOutlet weak var minutesPickerView: UIPickerView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pickerStackView: UIStackView!
    
    
    @IBAction func pauseButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func startButtonTapped(sender: AnyObject) {
        
        if timer.isOn == true {
            showTimerPicker()
            timer.stopTimer()
        } else {
            showTimerLabel()
            let hoursInSeconds = hoursPickerView.selectedRowInComponent(0)*60*60
            let minutesInSeconds = minutesPickerView.selectedRowInComponent(0)*60
            let seconds = hoursInSeconds + minutesInSeconds
            timer.setTimer(NSTimeInterval(seconds), totalSeconds: NSTimeInterval(seconds))
            timer.startTimer()
        }
    }
    
    
    
    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showTimerPicker", name: Timer.notificationComplete, object: timer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUILabel", name: Timer.notificationSecondTick, object: timer)
        
        pauseButton.layer.cornerRadius = 50
        startButton.layer.cornerRadius = 50
        
//        hoursPickerView.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUILabel() {
        timerLabel.text = timer.readableTime
    }
    
    func showTimerLabel() {
        pickerStackView.hidden = true
        timerLabel.hidden = false
        startButton.setTitle("Cancel", forState: UIControlState.Normal)
    }
    
    func showTimerPicker() {
        pickerStackView.hidden = false
        timerLabel.hidden = true
        startButton.setTitle("Start", forState: UIControlState.Normal)
        timer.isOn
    }
    

    // MARK: - Protocol Conformance Methods
    // MARK: UIPickerViewDataSource Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int { // Returns the number of components/columns for the specified UIPicker.
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { // Returns the number of rows for the specified UIPicker.
        if pickerView == hoursPickerView {
            return 24
        }
        else if pickerView == minutesPickerView {
            return 60
        } else {
            return 1
        }
    }
    // MARK: UIPickerViewDelegate Functions
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}




















