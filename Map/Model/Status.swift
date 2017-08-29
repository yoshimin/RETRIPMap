//
//  Status.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import Himotoki

public struct Status {
    let tweetId: String
    let mediaUrl: String?
    let text: String
}

extension Status: Decodable {
    public static func decode(_ e: Extractor) throws -> Status {
        return try Status (
            tweetId: e <| "id_str",
            mediaUrl: e <|? [ "entities", "media", "media_url_https" ],
            text: e <| "text"
        )
    }
}
