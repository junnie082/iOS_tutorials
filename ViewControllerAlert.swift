//
//  ViewController.swift
//  AlertChallenge
//
//  Created by Hyojeong_Jun on 2022/05/30.
//  https://moonibot.tistory.com/25

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var isClickConfirm = false
    var alarmTime: String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
        lblPickerTime.text = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        lblCurrentTime.text = formatter.string(from: date as Date)
        
        if isClickConfirm {
            return
        }
        
        if (alarmTime == currentTime) {
            
            Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timerOn), userInfo: nil, repeats: true)
            let time = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
            let okay = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            time.addAction(okay)
            present(time, animated: true, completion: nil)
            isClickConfirm = true
        }
        
    }
    
    @objc func timerOn() {
        isClickConfirm = false
    }
    
}

