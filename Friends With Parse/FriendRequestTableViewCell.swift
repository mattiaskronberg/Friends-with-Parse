//
//  FriendRequestTableViewCell.swift
//  Friends With Parse
//
//  Created by Mattias Kronberg on 2015-07-20.
//  Copyright (c) 2015 Mattias Kronberg. All rights reserved.
//

import UIKit

class FriendRequestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameCell: UILabel!
    var request: PFObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func acceptFriendRequest(sender: AnyObject)
    {
        UIView.animateWithDuration(1.5,
            delay: 0,
            options: .CurveLinear & .AllowUserInteraction & .BeginFromCurrentState,
            animations: {
                self.alpha = 0
            }, completion: nil)
        
        if let friendRequest = request {
            
            let toUser = request!["toUser"] as! PFUser
            let fromUser = request!["fromUser"] as! PFUser
            
            var friendRequestId = friendRequest.objectId!
            println(friendRequestId)
            
            PFCloud.callFunctionInBackground("addFriendToFriendsRelation", withParameters: ["friendRequest":friendRequestId]) {
                (response: AnyObject?, error: NSError?) -> Void in
                if error == nil {
                    
                    var friendsRelation = toUser.relationForKey("friends")
                    friendsRelation.addObject(fromUser)
                    toUser.saveInBackground()
                    
                } else {
                    println(error)
                }
            }
        }
    }
    
    @IBAction func declineFriendRequest(sender: AnyObject)
    {
        println("Decline friend request")
    }
}
