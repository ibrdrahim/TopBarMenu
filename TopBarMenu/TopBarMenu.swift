//
//  TopBarMenu.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class TopBarMenu : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    g
    let cellId = "TopBarMenuCell"
    let menuList = ["Simple Form","Table View","Image"]
    
    var homeController: HomeViewController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // set the menu bar color
        // Don't forget to set the navigation bar color on AppDelegate
        cv.backgroundColor = UIColor(red:0.30, green:0.41, blue:0.68, alpha:1.0)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        setupHorizontalBar()
    }
    
    func menuCellSelect(item : Int, section : Int){
        
        let selectedIndexPath = IndexPath(item: item, section: section)
        
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
        
        let cell = collectionView.cellForItem(at: selectedIndexPath) as! MenuCell
        cell.menu.textColor = UIColor.white
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        //new school way of laying out our views
        //in ios9
        //need x, y, width, height constraints
        let menuAvailable = CGFloat(1 / menuList.count)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: menuAvailable).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! MenuCell
        
        cell.menu.text = menuList[indexPath.item]
        
        if( indexPath.item == 0 ){
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            cell.menu.textColor = UIColor.white
        }else{
            cell.menu.textColor = UIColor.white.withAlphaComponent(0.4)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let menuAvailable = frame.width / CGFloat(menuList.count)
        
        return CGSize( width : menuAvailable,height : frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        cell.menu.textColor = UIColor.white
        
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
