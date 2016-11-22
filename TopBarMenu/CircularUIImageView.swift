//
//  CircularUIImageView.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/22/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class CircularUIImageView: UIImageView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        // image style
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
    }
}
