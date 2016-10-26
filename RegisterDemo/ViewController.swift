//
//  ViewController.swift
//  RegisterDemo
//
//  Created by snreddy on 10/25/16.
//  Copyright © 2016 snreddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPwdTextField: UITextField!
     var userEmail="";
    
    @IBOutlet weak var userRepeatPwdTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func registerButtonTapped(sender: AnyObject) {
        
         userEmail=userEmailTextField.text!
        let userPwd=userPwdTextField.text
        let userRepeatPwd=userRepeatPwdTextField.text
        
        // check for empty values here....
        
        if(userEmail.isEmpty || (userPwd?.isEmpty)! || (userRepeatPwd?.isEmpty)!){
            
            
            // Display Alert Message here
            print("failed")
            displayMyAlertMessage("All Feilds are required");
            
            return;
            
        }
        
        
        if(userPwd != userRepeatPwd)
        {
            displayMyAlertMessage("Passwords do not match");
            return;
            
        }
       

        if(isValidEmail(userEmail)){
            displayMyAlertMessage("Email address is not valid")
             print("KKKKKKKKK")
           return;
        }
        
       
    
        
    }
   
    func displayMyAlertMessage(userMessage:String){
        
        
        let myAlert=UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert )
        
        let okAction=UIAlertAction(title: "ok", style:UIAlertActionStyle.Default,handler: nil  )
        
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
       

        
        
    }
    
    func isValidEmail(enteredEmail: String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluateWithObject(enteredEmail)
    }
    
    
    
}

