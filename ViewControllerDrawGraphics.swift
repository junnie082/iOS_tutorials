//
//  ViewController.swift
//  DrawGraphicsChallenge
//
//  Created by Hyojeong_Jun on 2022/06/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(imgView.frame.size)
        
        // Do any additional setup after loading the view.
        drawTriangle()
        drawCircle(x1: 120, y1: 150, r: 100)
        drawCircle(x1: 120+50, y1: 150, r: 100)
        drawCircle(x1: 120-50, y1: 150, r: 100)
        drawCircle(x1: 120, y1: 150-50, r: 100)
        drawCircle(x1: 120, y1: 150+50, r: 100)
        
        UIGraphicsEndImageContext()
    }

    func drawTriangle() -> Void {
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.black.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func drawCircle(x1: Int, y1: Int, r: Int) -> Void {
        let context = UIGraphicsGetCurrentContext()!
    
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.addEllipse(in: CGRect(x: x1, y: y1, width: r, height: r))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
    }

}

