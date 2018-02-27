//
//  ButtonCustom.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit

class ButtonCustom: UIButton {
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.height / 4.0
        self.layer.masksToBounds = true
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
