//
//  View2Cell.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/22/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit


class View2Cell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
