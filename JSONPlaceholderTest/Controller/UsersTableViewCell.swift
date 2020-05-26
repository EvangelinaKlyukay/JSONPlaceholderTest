//
//  UsersTableViewCell.swift
//  JSONPlaceholderTest
//
//  Created by Евангелина Клюкай on 15.05.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var userScreen: User? {
        didSet {
            nameLabel.text = userScreen?.name
            phoneLabel.text = userScreen?.phone
            websiteLabel.text = userScreen?.website
            emailLabel.text = userScreen?.email
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let phoneTapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(phoneSelected))
        phoneTapRecognizer.numberOfTapsRequired = 1
        
        let websiteTapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(websiteSelected))
        phoneTapRecognizer.numberOfTapsRequired = 1
        
        let emailTapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(emailSelected))
        phoneTapRecognizer.numberOfTapsRequired = 1
        
        phoneLabel.addGestureRecognizer(phoneTapRecognizer)
        websiteLabel.addGestureRecognizer(websiteTapRecognizer)
        emailLabel.addGestureRecognizer(emailTapRecognizer)
    }
    
    @objc func phoneSelected(sender:UITapGestureRecognizer) {
        if let phone = userScreen?.phone, let url = URL(string: "tel://\(phone)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func websiteSelected(sender:UITapGestureRecognizer) {
        
        if let website = userScreen?.website, let url = URL(string: "http://\(website)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func emailSelected(sender:UITapGestureRecognizer) {
        
        if let email = userScreen?.email, let url = URL(string: "emailto:\(email)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
