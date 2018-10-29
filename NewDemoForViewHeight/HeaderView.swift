//
//  HeaderView.swift
//  NewDemoForViewHeight
//
//  Created by macbook on 10/27/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(HeaderButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var HeaderButton : UIButton = {
        
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height))
        
        btn.setTitle("All Data", for: .normal)
        btn.addTarget(self, action: #selector(TapedButton), for: .touchUpInside)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        return btn
        
    }()
    
    @objc func TapedButton(sender:UIButton)
    {
       print("Ok")
    }
}
