//
//  LoginViewController.swift
//  Facebook
//
//  Created by Sebastian Drew on 9/24/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var textfieldContainers: UIView!
    
    @IBOutlet weak var loginDisabledButton: UIButton!
    @IBOutlet weak var loginEnabledButton: UIButton!
    @IBOutlet weak var loginLoggingInButton: UIButton!
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var helpCenterButton: UIButton!
    
    var initialY: CGFloat!
    let offset: CGFloat = -50
    
    var signupInitialY: CGFloat!
    let signupOffset: CGFloat = -210
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEnabledButton.enabled = false
        loginEnabledButton.hidden = true
        loginDisabledButton.enabled = false
        loginDisabledButton.hidden = false
        loginLoggingInButton.enabled = false
        loginLoggingInButton.hidden = true
        
        activityInd.hidden = true
        
        
        initialY = textfieldContainers.frame.origin.y
        signupInitialY = signUpButton.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginDisabledButton(sender: AnyObject) {
    }
    
    @IBAction func loginEnabledButton(sender: AnyObject) {
        
        activityInd.startAnimating()
        activityInd.hidden = false
        delay(2, closure: { () -> () in
        
        if self.username.text == "u" && self.password.text == "p" {
            
           
                self.activityInd.stopAnimating()
                self.activityInd.hidden = true
                self.performSegueWithIdentifier("LoginSegue", sender: nil)

            
            } else {
            
            self.activityInd.stopAnimating()
            self.activityInd.hidden = true
        
                let alertView = UIAlertController(title: nil, message: "Username and/or Password is not correct.", preferredStyle: .Alert)
            
                let okAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                
                // ...
                
                }
                alertView.addAction(okAction)
            
                self.presentViewController(alertView, animated: true) {
                // ...
                }
            
            }
            
        })

    }
    
    @IBAction func LoginLoggingInButton(sender: AnyObject) {
    }
    
    @IBAction func didEditUsername(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            loginEnabledButton.enabled = false
            loginEnabledButton.hidden = true
            loginDisabledButton.hidden = false
            loginLoggingInButton.enabled = false
            loginLoggingInButton.hidden = true
        } else {
            loginEnabledButton.enabled = true
            loginEnabledButton.hidden = false
            loginDisabledButton.enabled = false
            loginDisabledButton.hidden = true
            loginLoggingInButton.enabled = false
            loginLoggingInButton.hidden = true
        }
    }
    
    @IBAction func didPressBackground(sender: AnyObject) {
        textfieldContainers.endEditing(true)
    }

    func keyboardWillShow(notification: NSNotification!) {
        
        self.textfieldContainers.frame.origin = CGPoint(x: self.textfieldContainers.frame.origin.x, y: self.initialY + self.offset)
        self.signUpButton.frame.origin = CGPoint(x: self.signUpButton.frame.origin.x, y: self.signupInitialY + self.signupOffset)
        self.helpCenterButton.alpha = 0
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        textfieldContainers.frame.origin = CGPoint(x: textfieldContainers.frame.origin.x, y: initialY)
        signUpButton.frame.origin = CGPoint(x: signUpButton.frame.origin.x, y: signupInitialY)
        helpCenterButton.alpha = 1
        
    }
    
}
