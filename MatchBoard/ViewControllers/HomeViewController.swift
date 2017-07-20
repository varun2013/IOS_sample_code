//
//  HomeViewController.swift
//  MatchBoard
//
//  Created by Talentelgia on 02/02/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Variables.
    
    @IBOutlet var segmentView: UISegmentedControl!
    
    
     //MARK:View life cycles
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.shadowImage = UIImage()

        // Set SegmentUI.
        self.setSegmentedControlUI()
        
        // Call Login View.
        self.callLoginView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - callLoginView
    func callLoginView() {
        
        // When users come first time call this functions.
        if !NSUserDefaults.standardUserDefaults().boolForKey("loginSessionKey")
        {
            // Add the login view controller.
            let controller = storyboard!.instantiateViewControllerWithIdentifier("LoginViewController")
            
            controller.view.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 222, CGRectGetWidth(self.view.frame), 222)
            
            self.view.addSubview(controller.view)
            
            addChildViewController(controller)
            
//            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "loginSessionKey")
            
        }

        
    }
    
    
    // MARK :- set segmentUI.
    func setSegmentedControlUI() {
    
        // Set segmented control.
        segmentView.backgroundColor = MatchboardColors.NavBar.color()
        
        // Segment Control Appearance
        segmentView.setDividerImage(MatchboardUtils.getImageWithColor(MatchboardColors.DarkBackground.color(), size: CGSizeMake(1.0, 1.0)), forLeftSegmentState: UIControlState.Normal, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        
        segmentView.setDividerImage(MatchboardUtils.getImageWithColor(MatchboardColors.DarkBackground.color(), size: CGSizeMake(1.0, 1.0)), forLeftSegmentState: UIControlState.Selected, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        
        segmentView.setDividerImage(MatchboardUtils.getImageWithColor(MatchboardColors.DarkBackground.color(), size: CGSizeMake(1.0, 1.0)), forLeftSegmentState: UIControlState.Normal, rightSegmentState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        
        segmentView.setBackgroundImage(UIImage(named: "SegCtrl-selected"), forState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        
        segmentView.setBackgroundImage(UIImage(named: "SegCtrl-normal"), forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        
        
        let attributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 12.0)!]
        
        segmentView.setTitleTextAttributes(attributes, forState: .Normal)
        
        let selectedAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        segmentView.setTitleTextAttributes(selectedAttributes, forState: .Selected)
        
    }

    

  
}
