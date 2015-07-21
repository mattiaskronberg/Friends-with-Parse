//
//  FriendListTableViewController.swift
//  Friends With Parse
//
//  Created by Mattias Kronberg on 2015-07-20.
//  Copyright (c) 2015 Mattias Kronberg. All rights reserved.
//

import UIKit

class FriendListTableViewController: UITableViewController {

    var user: PFUser?
    var friends = [PFUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = PFUser.currentUser()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        getFriends()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        println(friends.count)
        return friends.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendListTableViewCell
        let cellData = friends[indexPath.row]
        cell.friendNameLabel.text = cellData.username!
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    @IBAction func findFriends(sender: AnyObject)
    {
        performSegueWithIdentifier("findFriends", sender: self)
    }
    
    @IBAction func friendRequests(sender: AnyObject)
    {
        performSegueWithIdentifier("friendRequests", sender: self)
    }
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "findFriends"
        {
            var friendsArray = [String]()
            
            for object in friends
            {
                friendsArray.append(object.username!)
                
            }
            
            if let destination = segue.destinationViewController as? SearchFriendsTableViewController
            {
                destination.friends = friendsArray
            }
        }
    }
    
    
    // MARK: - Parse Querys and Methods
    
    
    @IBAction func logOut(sender: AnyObject)
    {
        PFUser.logOutInBackgroundWithBlock{
            (error: NSError?) -> Void in
            if error == nil {
                self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("logOut", sender: self)
            }
        }
    }
    
    func getFriends()
    {
        let relation = user?.relationForKey("friends")
        let query = relation?.query()
        if let relationQuery = query
        {
            relationQuery.findObjectsInBackgroundWithBlock{
                (objects: [AnyObject]?, error: NSError?) -> Void in
                if let friends = objects {
                    self.friends = objects as! [PFUser]
                    self.tableView.reloadData()
                }
            }
        }
    }
}
