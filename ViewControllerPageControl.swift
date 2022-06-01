//
//  ViewController.swift
//  PageControlChallenge
//
//  Created by Hyojeong_Jun on 2022/06/01.
//

import UIKit

var num = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

class ViewController: UIViewController {

    @IBOutlet var number: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        number.text = num[0]
        
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        number.text = num[pageControl.currentPage]
    }
    
}

