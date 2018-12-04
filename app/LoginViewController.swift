//
//  LoginViewController.swift
//  app
//
//  Created by DELGADO on 12/2/18.
//  Copyright © 2018 DELGADO. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        let userEmail=userEmailTextField.text;
        let userPassword=userPasswordTextField.text;
        
        let userEmailStored=UserDefaults.standard.string(forKey: "UserEmail");
    let             userPasswordStored=UserDefaults.standard.string(forKey: "UserPassword");
        
        if(userEmailStored==userEmail)
        {
            if(userPasswordStored==userPassword)
            {
               //entra
                UserDefaults.standard.set(true, forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil);
            }else
            {
                let myAlert=UIAlertController(title: "Alert", message: "Incorrect Email/Password", preferredStyle: UIAlertController.Style.alert);
                let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
                
                myAlert.addAction(okAction);
                self.present(myAlert,animated: true,completion: nil);
            }
        }
        else
        {
            let myAlert=UIAlertController(title: "Alert", message: "Incorrect Email/Password", preferredStyle: UIAlertController.Style.alert);
            let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
            
            myAlert.addAction(okAction);
            self.present(myAlert,animated: true,completion: nil);
        }
        
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
