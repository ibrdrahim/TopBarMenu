//
//  View2.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/22/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class View2 : UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contentView : UIView?
    var cellIdentifier:String = "view2Cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
        // additional option
        
        // use defined table nib, doesnt work in swift 3
        //let nibName = UINib(nibName: "InvitationTableViewCell", bundle: nil)
        //tableView.register(nibName, forCellReuseIdentifier: cellIdentifier)
        
        // setting up table row
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.autoresizingMask = UIViewAutoresizing.flexibleBottomMargin
        
        // don't show table separator
        //tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
    }
    
    func xibSetup() {
        
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
