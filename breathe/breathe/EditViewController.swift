//
//  EditViewController.swift
//  breathe
//
//  Created by Mialsy on 4/22/21.
//

import UIKit
import Parse
import UserNotifications
import Lottie

class EditViewController: UIViewController {
    @IBOutlet weak var briefField: UITextView!
    @IBOutlet weak var detailField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    var animationView: AnimationView?
    
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
        
        if briefField.text == "" {
            
            self.animationView = .init(name: "59674-erro-exchange")
            self.animationView?.frame = CGRect(x: 0, y: 0, width: 230, height: 230)
            self.animationView?.center = self.view.center
            self.animationView?.animationSpeed = 1.2
            self.view.addSubview(self.animationView!)
            self.animationView?.play()
            
            let when = DispatchTime.now() + 1.5
            DispatchQueue.main.asyncAfter(deadline: when){
              // your code with delay
                self.animationView?.removeFromSuperview()
                let alert = UIAlertController(title: "Invalid Task Title", message: "Please input the task title.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        task["brief"] = briefField.text!
        task["detail"] = detailField.text!
        task["user"] = PFUser.current()!
        
        task.saveInBackground {(success, error) in
            if success {
                self.animationView = .init(name: "35593-goal-completed")
                self.animationView?.frame = CGRect(x: 0, y: 0, width: 230, height: 230)
                self.animationView?.center = self.view.center
                self.animationView?.animationSpeed = 1.2
                self.view.addSubview(self.animationView!)
                self.animationView?.play()
                
                let when = DispatchTime.now() + 1.5
                DispatchQueue.main.asyncAfter(deadline: when){
                  // your code with delay
                    self.animationView?.removeFromSuperview()
                    self.dismiss(animated: true, completion: nil)
                }
                
                print("task added")
            } else {
                let alert = UIAlertController(title: "Error adding task", message: "Please try again later.", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

                
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
