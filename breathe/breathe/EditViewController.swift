//
//  EditViewController.swift
//  breathe
//
//  Created by Mialsy on 4/22/21.
//

import UIKit
import Parse
import UserNotifications

class EditViewController: UIViewController {
    @IBOutlet weak var briefField: UITextView!
    @IBOutlet weak var detailField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var alarmSwitch: UISwitch!

    @IBAction func onSwitch(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        let date = datePicker.date
        let dateComponent = datePicker.calendar.dateComponents(
            [.hour, .minute, .day, .month, .year], from: date)
        
        let dateString = String(dateComponent.minute ?? 0) + String(dateComponent.hour ?? 0) + String(dateComponent.day ?? 0) + String(dateComponent.month ?? 0)  + String(dateComponent.year ?? 0)
        
        let dateHashcode = String(dateComponent.hashValue)
        
        if alarmSwitch.isOn {
            
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                
                if let error = error {
                    print(error)
                }
                // Enable or disable features based on the authorization.
            }
            
            let content = UNMutableNotificationContent()

            content.title = briefField.text
            content.sound = UNNotificationSound.default
            content.badge = 1

            let trigger = UNCalendarNotificationTrigger(
                dateMatching: dateComponent, repeats: false)

            let request = UNNotificationRequest(identifier: dateHashcode, content: content, trigger: trigger)
            
            center.add(request, withCompletionHandler: nil)
            print(dateString)
            
            print(dateHashcode)
        } else {
            // TODO: cancel
            print("off")
        }
    }
    
    @IBAction func onAddTask(_ sender: Any) {
        let task = PFObject(className: "Tasks")
        
        task["brief"] = briefField.text!
        task["detail"] = briefField.text!
//        task["user"] = PFUser.current()!
        
        task.saveInBackground {(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("task added")
            } else {
                print("error")
            }
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
