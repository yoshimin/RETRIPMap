//
//  String+URLEncode.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/04.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation

extension String {
    func urlEncode() -> String {
        let allowedCharacterSet = NSMutableCharacterSet.alphanumeric()
        allowedCharacterSet.addCharacters(in: "-._~")
        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet as CharacterSet)!
    }
}
