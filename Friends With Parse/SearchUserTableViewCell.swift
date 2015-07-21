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
    var user: PFUser?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func addFriend(sender: AnyObject)
    {
        println("Add Friend!")
        var request = PFObject(className: "friendRequest")
        request["fromUser"] = PFUser.currentUser()
        request["toUser"] = user
        request.saveInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
            if success {
                println("Request sent")
                self.sendRequestButton.removeFromSuperview()
            }
        }
    }

}
