//
//  SearchUserTableViewCell.swift
//  Friends With Parse
//
//  Created by Mattias Kronberg on 2015-07-20.
//  Copyright (c) 2015 Mattias Kronberg. All rights reserved.
//

import UIKit

class SearchUserTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var sendRequestButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
