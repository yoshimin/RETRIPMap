//
//  SearchResult.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import Himotoki

public struct SearchResult {
    let nextResults: String
    let refresh_url: String
    let statuses: [Status]
}

extension SearchResult: Decodable {
    public static func decode(_ e: Extractor) throws -> SearchResult {
        return try SearchResult (
            nextResults: e <| [ "search_metadata", "refresh_url" ],
            refresh_url: e <| [ "search_metadata", "next_results" ],
            statuses: e <|| "statuses"
        )
    }
}
