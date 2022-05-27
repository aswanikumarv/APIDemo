//
//  ViewController.swift
//  APIDemo
//
//  Created by Ashwin  on 26/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profilesTableView: UITableView!
    var profileData = [ProfileViewModel]()
    var profileService = ProfileService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        profilesTableView.register(nib, forCellReuseIdentifier: "ProfileTableViewCell")
        
        profileService.bindProfileServiceToProfileViewModel = {[weak self] profileData in
            guard let self = self else { return }
            self.profileData = profileData
            DispatchQueue.main.async {
                self.profilesTableView.reloadData()
            }
        }
        
        profileService.fetchData()
    }
}

// MARK: -

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profilesTableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.profileViewModel = profileData[indexPath.row]
        
        return cell
    }
}

