//
//  SettingsViewController.swift
//  Facebook
//
//  Created by Sebastian Drew on 9/17/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // settingsScrollView.contentSize = CGSize(width: 320, height: 1800)
        
        settingsScrollView.contentSize = settingsImage.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        settingsScrollView.contentInset.top = 0
        settingsScrollView.contentInset.bottom = 50
        settingsScrollView.scrollIndicatorInsets.top = 0
        settingsScrollView.scrollIndicatorInsets.bottom = 50
        
    }

    @IBAction func logoutButtonDidTouch(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to logout?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            
            self.performSegueWithIdentifier("LogoutSegue", sender: nil)
            
        }
        
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
    }

}
