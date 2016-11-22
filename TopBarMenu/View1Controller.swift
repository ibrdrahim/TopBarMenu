//
//  View1Controller.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/22/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class View1Controller : BaseCell {
    
    lazy var view1 : View1 = {
       let v1 = View1()
        return v1
    }()
    
    override func setupViews() {
        addSubview(view1)
        addConstraintsWithFormat(format: "H:|[v0]|", views: view1)
        addConstraintsWithFormat(format: "V:|[v0]|", views: view1)
    }
    
}
