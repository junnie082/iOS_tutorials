//
//  ViewController.swift
//  ImageViewChallenge
//
//  Created by Hyojeong_Jun on 2022/04/29.
//

import UIKit

class ViewController: UIViewController {

    var i: Int = 0
    
    @IBOutlet var titleView: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    var scuba1: UIImage?
    var scuba2: UIImage?
    var stst1: UIImage?
    var stst2: UIImage?
    var imgArray: [UIImage?] = []
    var titleArray: [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scuba1 = UIImage(named: "scuba1.png")
        scuba2 = UIImage(named: "scuba2.png")
        stst1 = UIImage(named: "stst1.png")
        stst2 = UIImage(named: "stst2.png")
        
        imgArray = [scuba1, scuba2, stst1, stst2]
        titleArray = ["scuba1", "scuba2", "stst1", "stst2"]
        
        imgView.image = imgArray[0]
        titleView.text = titleArray[0]
        
    }

    @IBAction func previous(_ sender: UIButton) {
        if imgView.image == imgArray[0] {
            i = 0
            titleView.text = "scuba1. 맨 처음 사진입니다."
            imgView.image = imgArray[0]
        } else {
            i -= 1
            imgView.image = imgArray[i]
            titleView.text = titleArray[i]
        }
    }
    
    @IBAction func next(_ sender: UIButton) {
        if imgView.image == imgArray[3] {
            i = 3
            titleView.text = "stst2. 마지막 사진입니다."
            imgView.image = imgArray[3]
        } else {
            i += 1
            titleView.text = titleArray[i]
            imgView.image = imgArray[i]
        }
    }
    
    
}

