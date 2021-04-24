//
//  EditViewController.swift
//  breathe
//
//  Created by Mialsy on 4/22/21.
//

import UIKit
import Parse

class EditViewController: UIViewController {
    @IBOutlet weak var briefField: UITextView!
    @IBOutlet weak var detailField: UITextView!
    
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
