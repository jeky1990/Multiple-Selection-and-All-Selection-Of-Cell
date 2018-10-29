//
//  ViewController.swift
//  NewDemoForViewHeight
//
//  Created by macbook on 10/26/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ViewHeight: NSLayoutConstraint!
    
    var increase : CGFloat = 100
    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func DeviceHeight() -> CGFloat
    {
        return self.view.frame.size.height
    }
    
    @IBAction func AddAction(_ sender: Any) {
        let rect = viewA.frame
        if btnAdd.frame.origin.y - (rect.origin.y + rect.size.height + 30) > 30 {
            increase += 30
            ViewHeight.constant = increase
        }
    }
    
    @IBAction func MinusAction(_ sender: Any) {
        
        if ViewHeight.constant > 100
        {
            increase -= 30
            ViewHeight.constant = increase
        }
    }
}

