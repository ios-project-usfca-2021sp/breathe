//
//  MotivationCell.swift
//  breathe
//
//  Created by rebecca yohannes on 4/19/21.
//

import UIKit

class MotivationCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func MotivationButton(_ sender: Any) {
        let array = ["“People Who Are Crazy Enough To Think They Can Change The World, Are The Ones Who Do.” – Rob Siltanen", "“We May Encounter Many Defeats But We Must Not Be Defeated.” – Maya Angelou", "“The Only Limit To Our Realization Of Tomorrow Will Be Our Doubts Of Today.” – Franklin D. Roosevelt"]
                MotivationLabel.text = array.randomElement()
    }
    
    @IBOutlet weak var MotivationLabel: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
