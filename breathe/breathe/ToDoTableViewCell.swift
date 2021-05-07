////
////  ToDoTableViewCell.swift
////  breathe
////
////  Created by Anoushka Erram on 4/29/21.
////
//
//  ToDoTableViewCell.swift
//  breathe
//
//  Created by Anoushka Erram on 4/29/21.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskTitle: UILabel!

    @IBOutlet weak var checkButton: UIButton!

    @IBOutlet weak var taskDesc: UILabel!

    @IBAction func checkBox(_ sender: Any) {
        let checkMarked = !checked
        if(checkMarked){
            self.setChecked(true)
        }
        else{
            self.setChecked(false)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var checked:Bool = false
    var taskId:Int = -1
    
    func setChecked(_ isChecked: Bool){
        checked = isChecked
        if(checked){
            checkButton.setImage(UIImage(named: "checkedbox"), for: UIControl.State.normal)
        }
        else{
            checkButton.setImage(UIImage(named: "uncheckedbo"), for: UIControl.State.normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
