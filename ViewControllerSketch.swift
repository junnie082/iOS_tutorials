//
//  ViewController.swift
//  SketchChallenge
//
//  Created by Hyojeong_Jun on 2022/06/12.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txWidth: UITextField!
    @IBOutlet var testLabel: UILabel!
    
    
    var lastPoint: CGPoint!  // 바로 전에 터치하거나 이동한 위치
    var lineSize: CGFloat = 2.0 // 선의 두께를 2.0으로 설정
    var lineColor = UIColor.red.cgColor  // 선 색상을 빨간색으로 설정

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txWidth.delegate = self
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 그림을 그리기 위한 콘텍스트 생성
        UIGraphicsBeginImageContext(imgView.frame.size)
        // 선 색상을 설정
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        // 선 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        // 선 두께를 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch // 현재 발생한 터치 이벤트를 가지고 옴
        // 터치된 좌표를 currPoint 로 가지고 옴
        let currPoint = touch.location(in: imgView)
        
        // 현재 imgView에 있는 전체 이미지를 imgView 의 크기로 그림
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 할당
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()  // 그림 그리기를 끝냄
        
        lastPoint = currPoint  // 현재 터치된 위치를 lastPoint 라는 변수에 할당
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
    @IBAction func btnBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    @IBAction func btnRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    @IBAction func btnGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    @IBAction func btnBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lineSize = CGFloat(NSString(string: txWidth.text ?? "2").floatValue)
        return true
    }
    
}

