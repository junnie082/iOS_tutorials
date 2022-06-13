//
//  ViewController.swift
//  SwipeGestureChallenge
//
//  Created by Hyojeong_Jun on 2022/06/14.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    var i: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.green
        
        imgView.image = UIImage(named: images[0])
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }

//    @IBAction func pageChange(_ sender: UIPageControl) {
//        imgView.image = UIImage(named: images[pageControl.currentPage])
//    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            print(i)
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.left {
                i += 1
                if i>images.count-1 {
                    i -= 1
                }
                imgView.image = UIImage(named: images[i])

            } else if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
                i -= 1
                if i < 0 {
                    i += 1
                }
                
                imgView.image = UIImage(named: images[i])
            }
            pageControl.currentPage = i
    }
    
}
    
}

