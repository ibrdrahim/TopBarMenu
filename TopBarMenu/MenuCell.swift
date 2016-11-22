//
//  MenuCell.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let menu: UILabel = {
        let lbl = UILabel()
        lbl.textColor       = UIColor.white.withAlphaComponent(0.4)
        lbl.textAlignment   = NSTextAlignment.center
        lbl.font = lbl.font.withSize(14.0)
        return lbl
    }()
    
    override var isHighlighted: Bool {
        didSet {
            menu.textColor = isHighlighted ? UIColor.white : UIColor.white.withAlphaComponent(0.4)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menu.textColor = isHighlighted ? UIColor.white : UIColor.white.withAlphaComponent(0.4)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(menu)
        addConstraintsWithFormat(format:"H:[v0(110)]", views: menu)
        addConstraintsWithFormat(format:"V:[v0(28)]", views: menu)
        
        addConstraint(NSLayoutConstraint(item: menu, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: menu, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
