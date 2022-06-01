//
//  ViewController.swift
//  TabChallenge
//
//  Created by Hyojeong_Jun on 2022/06/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnMovePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}

