//
//  TwitterAPIRequest.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation

public protocol  TwitterAPIRequest {
    var url: String { get }
    var method: String { get }
    var parameters: [AnyHashable : Any]? { get }
}
