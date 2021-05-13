//
//  MotivationViewController.swift
//  breathe
//
//  Created by rebecca yohannes on 4/19/21.
//

import UIKit
import Parse

class MotivationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func MotivationButton(_ sender: Any) {

        let array = ["“People Who Are Crazy Enough To Think They Can Change The World, Are The Ones Who Do.” – Rob Siltanen", "“We May Encounter Many Defeats But We Must Not Be Defeated.” – Maya Angelou", "“The Only Limit To Our Realization Of Tomorrow Will Be Our Doubts Of Today.” – Franklin D. Roosevelt", "“Things Work Out Best For Those Who Make The Best Of How Things Work Out.” –  John Wooden", "“Today’s Accomplishments Were Yesterday’s Impossibilities.” – Robert H. Schuller", " “You Don’t Have To Be Great To Start, But You Have To Start To Be Great.” – Zig Ziglar", "“There Are No Limits To What You Can Accomplish, Except The Limits You Place On Your Own Thinking.” – Brian Tracy", "“Integrity Is The Most Valuable And Respected Quality Of Leadership. Always Keep Your Word.”-Brian Tracy","“Security Is Mostly A Superstition. Life Is Either A Daring Adventure Or Nothing.” –  Helen Keller", "“The Man Who Has Confidence In Himself Gains The Confidence Of Others.” – Hasidic Proverb"]
        MotivationLabel.text = array.randomElement()
    }
    
    @IBOutlet weak var MotivationLabel: UILabel!
    

    
    //when button is clicked counter increments
    //and healthyLabel is updated
    var count : Int = 0
    @IBAction func HealthyButton(_ sender: Any) {
        print(count)
        let array_new = ["1) Sleep Enough 2) Eat Breakfast, and Lunch, and Dinner 3) Raise Your Heart Rate Every Day", "1) Sweat (and Stretch) Twice a Week 2) Wash Your Hands 3) Stay Hydrated ","1) Don’t fight stress by eating 2) Limit sugary and caffeinated beverages 3) Take advantage of fitness courses",  "1) Get a full night’s rest whenever possible 2) Wash your hands 3) Put limits on work hours", "1) Understand you can’t do everything 2) Don’t let stress get the best of you 3) Keep backpacks from being too heavy"," 1) Learn time management skills 2) Avoid all nighters 3) Avoid caffeine, eating and drinking right before bed", "1) Incorporate different kinds of exercise in your routine 2) Keep healthy snacks around 3) Take vitamins"]
        
        HealthyLabel.text = array_new[count]
            print(array_new[count])
        count = count + 1
        
        
        if count == array_new.count {
            count = 0
            
        }
        
        
        
    }
    
    
    
    @IBOutlet weak var HealthyLabel: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginRegisterViewController = main.instantiateViewController(identifier: "LoginRegisterViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginRegisterViewController
    }
    

}
