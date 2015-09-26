
//
//  FeedViewController.swift
//  Facebook
//
//  Created by Sebastian Drew on 9/17/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var refreshControl: UIRefreshControl!

   @IBOutlet weak var feedScrollView: UIScrollView!
   @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var coverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        feedScrollView.insertSubview(refreshControl, atIndex: 0)

        feedScrollView.contentSize = feedImage.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        spinner.startAnimating()
        spinner.hidden = false
        
        delay(2, closure: { () -> () in
            self.spinner.stopAnimating()
            UIView.animateWithDuration(0.4, animations: {
               
                self.coverView.alpha = 0
                
            })
            
        })
        
        feedScrollView.contentInset.top = 0
        feedScrollView.contentInset.bottom = 50
        feedScrollView.scrollIndicatorInsets.top = 0
        feedScrollView.scrollIndicatorInsets.bottom = 50
        
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(2, closure: {
            self.refreshControl.endRefreshing()
        })
    }

}
