//
//  RoundedButton.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/07/20.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = frame.width * 0.5
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}
