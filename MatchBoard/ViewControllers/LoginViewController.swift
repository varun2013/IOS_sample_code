//
//  LoginViewController.swift
//  MatchBoard
//
//  Created by Talentelgia on 02/02/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    // Variables.
    
    @IBOutlet var button_RegisterWithPhone: UIButton!
    @IBOutlet var button_RegisterWithFacebook: UIButton!
    
    
    //MARK:View life cycles

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK :- Register Phone Number.
    @IBAction func button_RegisterWithPhone(sender: AnyObject) {

    }
    
    // MARK :- Register Facebook.
    @IBAction func button_RegisterWithFacebook(sender: AnyObject) {
        
        // Read Permission.
        let facebookReadPermissions = ["public_profile", "email", "user_friends"]
        
        // check facebook login session.
        func loginToFacebookWithSuccess(successBlock: () -> (), andFailure failureBlock: (NSError?) -> ()) {
            
            if FBSDKAccessToken.currentAccessToken() != nil {
                //For debugging, when we want to ensure that facebook login always happens
                //FBSDKLoginManager().logOut()
                //Otherwise do:
                return
            }
            
            // Call Read Permissions View.
            FBSDKLoginManager().logInWithReadPermissions( facebookReadPermissions, fromViewController: self) { (result, error) -> Void in
                
                if error != nil {
                    //According to Facebook:
                    //Errors will rarely occur in the typical login flow because the login dialog
                    //presented by Facebook via single sign on will guide the users to resolve any errors.
                    
                    // Process error
                    FBSDKLoginManager().logOut()//
                    //     failureBlock(error)
                    
                } else if result.isCancelled {
                    // Handle cancellations
                    FBSDKLoginManager().logOut()
                    //      failureBlock(nil)
                    
                } else {
                    
                    let fbloginresult : FBSDKLoginManagerLoginResult = result
                    
                    if(fbloginresult.grantedPermissions.contains("email"))
                        
                    {
                        self.returnFacebookUserData()
                        //fbLoginManager.logOut()
                    }
                    
                }
                
            }
        
        }
        
    }
    
    // Return Facebook Data.
    func returnFacebookUserData()
    {
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            // Set Graph Requset permissions.
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                    result.valueForKey("email") as! String
                    result.valueForKey("id") as! String
                    result.valueForKey("name") as! String
                    result.valueForKey("first_name") as! String
                    result.valueForKey("last_name") as! String
                }
                
            })
            
        }
        
    }
    
    
}
