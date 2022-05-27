//
//  ProfileViewModel.swift
//  TableWithJson
//
//  Created by Ashwin  on 26/02/22.
//

import Foundation
import UIKit

struct ProfileViewModel {
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(profile: Profile) {
        self.title = profile.title
        self.url = profile.url
        self.thumbnailUrl = profile.thumbnailURL
    }
}
