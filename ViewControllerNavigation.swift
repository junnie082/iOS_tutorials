//
//  ViewController.swift
//  NavigationChallenge
//
//  Created by Hyojeong_Jun on 2022/06/07.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    // 한 번만 누르면 확대가 되고 두 번 누르면 축소가 됨. 한 번만 누르면 상태가 바뀌려면 어떻게 코드를 짜야할까?
    
    // 버튼을 누른 후에 수정화면에서 [확대] 버튼의 상태가 바뀌지 않는다. 하지만 버튼을 누를 때마다 이미지의 크기가 바뀌긴 함.
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")

    var isOn = true
    var isZoom = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar Button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
        editViewController.isZoom = isZoom
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }

    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        if (isZoom) {  // 축소 버튼을 누름.
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            self.isZoom = false
        } else {  // 확대 버튼을 누름.
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            self.isZoom = true
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
}

