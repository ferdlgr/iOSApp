//
//  RegisterViewController.swift
//  app
//
//  Created by DELGADO on 12/1/18.
//  Copyright © 2018 DELGADO. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        let mail=userEmailTextField.text;
        let pass=userPasswordTextField.text;
        let pass2=repeatPasswordTextField.text;
    
    
        if((mail?.isEmpty)!||(pass?.isEmpty)!||(pass2?.isEmpty)!)
        {
        let myAlert=UIAlertController(title: "Alert", message: "All fields required", preferredStyle: UIAlertController.Style.alert);
        let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert,animated: true,completion: nil);
     
        }
        
        if((pass?.elementsEqual(pass2!))!)
        {
            UserDefaults.standard.set(mail,forKey:  "UserEmail")
            UserDefaults.standard.set(pass,forKey:  "UserPassword")
            UserDefaults.standard.synchronize()
            
            let myAlert=UIAlertController(title: "Alert", message: "Success", preferredStyle: UIAlertController.Style.alert);
            let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in     self.dismiss(animated: true, completion: nil)}
            
            myAlert.addAction(okAction);
            self.present(myAlert,animated: true,completion: nil);
            
        }
        else
        {
            let myAlert=UIAlertController(title: "Alert", message: "Passwords do not match", preferredStyle: UIAlertController.Style.alert);
            let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
            self.dismiss(animated: true, completion: nil)
            myAlert.addAction(okAction);
            self.present(myAlert,animated: true,completion: nil);
        }
     
       
     //check empty
     
     /*
     if(userPassword!=repeatPassword)
     {
     //alert
     display(userMessage: "Passwords do not match");
     
     }*/
     //store data
     
     }
    
    
    
    
     func display(userMessage:String)
     {
     let myAlert=UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert);
     let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
     
     myAlert.addAction(okAction);
     self.present(myAlert,animated: true,completion: nil);
     }
     /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
     
     }

    

        
        
       
     

