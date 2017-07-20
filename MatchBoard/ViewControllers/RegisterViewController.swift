//
//  RegisterViewController.swift
//  MatchBoard
//
//  Created by Talentelgia on 02/02/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setTextFieldPadding() {
        self.leftViewMode = UITextFieldViewMode.Always
        let textFieldBackgroundView = UIView(frame: CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), 5, CGRectGetHeight(self.frame)))
        self.leftView = textFieldBackgroundView
    }
}


class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIActionSheetDelegate {

    // Variables.
    
    @IBOutlet var textField_Name: UITextField!
    @IBOutlet var textField_PhoneNumber: UITextField!
    @IBOutlet var button_Register: DesignButton!
    @IBOutlet var image_UserChooseImage: UIImageView!
    let imagePicker = UIImagePickerController()

    
    //MARK: View life cycles
    
    override func viewWillAppear(animated: Bool) {
        // Set navigation title.
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "REGISTER"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        // Set UIImagePickerController Delegate.
        imagePicker.delegate = self
        
        // Set textfiled padding.
        textField_Name.setTextFieldPadding()
        textField_PhoneNumber.setTextFieldPadding()

        // Set Gesture on image view.
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(RegisterViewController.clickOnImageView))
        singleTap.numberOfTapsRequired = 1
        image_UserChooseImage.userInteractionEnabled = true
        image_UserChooseImage.addGestureRecognizer(singleTap)
        
    }

    
    // MARK:- UITextField Delegate.
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if (string == " ") {
            return false
        }
        return true
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK:- Dismisses Keyboard when View Touched
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // Image view selected by view Action.
    func clickOnImageView() {
        print("Single Tap on imageview")
        
        textField_Name.resignFirstResponder()
        textField_PhoneNumber.resignFirstResponder()
        
        // Open ActionSheet for choose photos.
        let actionSheet = UIActionSheet(title: "Choose Photo", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle:nil, otherButtonTitles: "Take Photo", "Photo Library")
        actionSheet.showInView(self.view)
        
    }
    
    
    // MARK:- UIActionsheet Delegate.
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int)
    {
        
        switch buttonIndex{
        case 0:
            NSLog("Cancel");
            break;
            
        case 1:
            NSLog("Take Photo");
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .Camera
            presentViewController(imagePicker, animated: true, completion: nil)
            break;
            
        case 2:
            NSLog("Photo Librar");
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
            break;
            
        default:
            NSLog("Default");
            break;
        }
    }
    
    
    // MARK:- UIImagePickerController Delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil, nil)
            image_UserChooseImage.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "VerifyPhoneSegue"
        {
            if textField_Name.text!.characters.count == 0 {
                showAlert("Display Name", message: "You must enter a display name.")
                return false
            }
            
            // validation stuff
            if textField_PhoneNumber.text!.characters.count != 10 {
                showAlert("Phone Login", message: "You must enter a 10-digit US phone number including area code.")
                return false
            }
        }
        
        return true
        
    }
    
    // MARK:- UI Alert
    func showAlert(title: String, message: String) {
        return UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK").show()
        
    }

}
