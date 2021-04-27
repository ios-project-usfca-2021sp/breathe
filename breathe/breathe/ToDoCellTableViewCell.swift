//
//  ToDoCellTableViewCell.swift
//  breathe
//
//  Created by Anoushka Erram on 4/23/21.
//

import UIKit

class ToDoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var taskTitle: UILabel!
    
    
    @IBOutlet weak var taskDescription: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
