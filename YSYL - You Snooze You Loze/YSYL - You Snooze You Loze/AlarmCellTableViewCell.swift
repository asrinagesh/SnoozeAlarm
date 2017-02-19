//
//  AlarmCellTableViewCell.swift
//  YSYL - You Snooze You Loze
//
//  Created by Kelden Lin on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import UIKit

class AlarmCellTableViewCell: UITableViewCell {
    @IBOutlet var alarmTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
