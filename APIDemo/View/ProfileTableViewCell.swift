//
//  ProfileTableViewCell.swift
//  TableWithJson
//
//  Created by Ashwin  on 26/02/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    var profileViewModel: ProfileViewModel!
    {
        didSet {
            label.text = profileViewModel.title
            imgView.loadRemoteImageUsingUrlString(urlString: profileViewModel.url)
            label.sizeToFit()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.translatesAutoresizingMaskIntoConstraints = false
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
