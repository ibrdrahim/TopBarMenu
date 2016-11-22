//
//  View2Controller.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/22/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class View2Controller : BaseCell,UITableViewDelegate,UITableViewDataSource {
    
    var data = [
        "data 1" , "data 2" ,
        "data 3" , "data 4" ,
        "data 5" , "data 6" ,
        "data 7" , "data 8" ,
        "data 9" , "data 10" ,
    ]
    
    lazy var view2 : View2 = {
        let v2 = View2()
        v2.tableView.delegate = self
        v2.tableView.dataSource = self
        return v2
    }()
    
    override func setupViews() {
        addSubview(view2)
        addConstraintsWithFormat(format: "H:|[v0]|", views: view2)
        addConstraintsWithFormat(format: "V:|[v0]|", views: view2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let nibName = UINib(nibName: "View2Cell", bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: view2.cellIdentifier)
            
            let cell = tableView.dequeueReusableCell(withIdentifier: view2.cellIdentifier, for: indexPath) as! View2Cell
            
            cell.title.text = data[indexPath.item / 2]
            cell.photo.image = UIImage(named: "avatar")
            cell.desc.text = "all work and no play makes jack a dull boy"
            
            return cell
            
        }else{
            
            let cell = UITableViewCell()
            
            cell.textLabel!.text = nil
            cell.imageView?.image = nil
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 == 0 {
            return 100
        }else{
            return 20
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return data and rows separator
        return data.count * 2
    }
    
}
