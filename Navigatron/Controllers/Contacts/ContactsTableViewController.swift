//
//  ContactsTableViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 4/1/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    private let contacts = ["David Charleston", "Jonathan Phaedrus", "Megan Tarash", "Missouri Williams", "Edmund Sense"]
    var selectedContact: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = contacts[indexPath.row]
        performSegue(withIdentifier: "GoToContact", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToContact" {
            let contactViewController = segue.destination as! ContactViewController
            contactViewController.selectedContact = selectedContact ?? "Unknown Contact"
        }
    }
}
