//
//  ProfileService.swift
//  TableWithJson
//
//  Created by Ashwin  on 26/02/22.
//

import Foundation
class ProfileService {
    
    var bindProfileServiceToProfileViewModel: ([ProfileViewModel]) -> () = {_ in}
    private(set) var profileData: [ProfileViewModel]!
    {
        didSet {
            self.bindProfileServiceToProfileViewModel(profileData)
        }
    }
    
    func fetchData() {
        NetworkManager.shared.fetchData(urlString: "https://jsonplaceholder.typicode.com/photos") { (result: Result<Profiles, CustomError>) in
            switch(result) {
            case .success(let profiles):
                self.profileData = profiles.map({ return ProfileViewModel(profile: $0)})
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
