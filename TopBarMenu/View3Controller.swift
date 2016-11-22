//
//  View3Controller.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/22/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class View3Controller : BaseCell {
    
    lazy var view3 : View3 = {
        let v3 = View3()
        v3.imageView.image = UIImage(named:"candy-bg")
        return v3
    }()
    
    override func setupViews() {
        addSubview(view3)
        addConstraintsWithFormat(format: "H:|[v0]|", views: view3)
        addConstraintsWithFormat(format: "V:|[v0]|", views: view3)
    }
    
}
