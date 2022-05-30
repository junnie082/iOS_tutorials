//
//  ViewController.swift
//  DatePickerChallenge
//
//  Created by Hyojeong_Jun on 2022/05/11.
//  https://coding-sojin2.tistory.com/154

import UIKit

class ViewController: UIViewController {
    // 타이머가 구동되면 실행할 함수
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime:String?

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    
    

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender   // 전달된 인수 저장
        let formatter = DateFormatter()  // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    
        lblPickerTime.text = "현재시간: " + formatter.string(from: datePickerView.date)
        
    }
    
    // 타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func updateTime() {
        //count 값을 문자열로 변환하여 lblCurrentTime.text 에 출력
        //lblCurrentTime.text = String(count)
        //count += 1   //count 값을 1 증가
        
        let date = NSDate() // 현재 시간을 가져옴
        
        // DateFormatter 라는 클래스의 상수 formatter 를 선언
        let formatter = DateFormatter()
        
        // 상수 formatter의 dateFormat 속성을 설정
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(for: date)
        
        // 현재 날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로
        // string 메서드를 사용하여 문자열(String)로 변환
        // 문자열로 변환한 date 값을 "현재시간: "이라는 문자열에 추가
        // 그리고 그 문자열을 lblCurrentTime의 text 에 입력
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        if (currentTime == alarmTime) {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
        
    }
    
}

