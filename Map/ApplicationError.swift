//
//  ApplicationError.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation

enum ApplicationError: Error {
    case networkError
    case apiError
    case parseError
}
