//
//  Profile.swift
//  TableWithJson
//
//  Created by Ashwin  on 26/02/22.
//

import Foundation
struct Profile: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias Profiles = [Profile]
