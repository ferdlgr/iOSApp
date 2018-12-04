//
//  ViewController.swift
//  app
//
//  Created by DELGADO on 12/1/18.
//  Copyright © 2018 DELGADO. All rights reserved.
//

import UIKit

import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content=UNMutableNotificationContent()
        content.title="Notificacion"
        content.body="Esta es una notificacion"
        content.sound=UNNotificationSound.default
        
        let trigger=UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request=UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    override func viewDidAppear( _ animated: Bool) {
        
        let isUserLoggedIn=UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        if(!isUserLoggedIn)
        {
        self.performSegue(withIdentifier: "loginView", sender: self);
        }
    }
    
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false,forKey: "isUserLoggedIn");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginView", sender: self);
    }
        
    }
    


