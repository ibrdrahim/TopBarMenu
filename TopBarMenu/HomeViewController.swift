//
//  HomeViewController.swift
//  TopBarMenu
//
//  Created by ibrahim on 11/3/16.
//  Copyright © 2016 Indosytem. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    // Don't forget to update menu list on TopBarMenu.swift
    lazy var topMenuBar : TopBarMenu = {
        let tmb = TopBarMenu()
        tmb.homeController = self
        return tmb
    }()
    
    let defaultCell = "defaultCell"
    let view1 = "View1"
    let view2 = "View2"
    let view3 = "View3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        setupTopBarMenu()
        setupCollectionView()
        
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    private func setupTopBarMenu(){
        view.addSubview(topMenuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: topMenuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: topMenuBar)
        
        //topMenuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
        // register main cell id
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: defaultCell)
        // register each view as cell
        collectionView?.register(View1Controller.self, forCellWithReuseIdentifier: view1)
        collectionView?.register(View2Controller.self, forCellWithReuseIdentifier: view2)
        collectionView?.register(View3Controller.self, forCellWithReuseIdentifier: view3)
        
        collectionView?.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(100, 0, 0, 0)
        
        collectionView?.showsHorizontalScrollIndicator = false
        
        collectionView?.isPagingEnabled = true
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        topMenuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / CGFloat(topMenuBar.menuList.count)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        
        topMenuBar.menuCellSelect(item: Int(index), section: 0)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of menu list on top bar menu
        return topMenuBar.menuList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: view1, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: view2, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: view3, for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: defaultCell, for: indexPath)
            return cell
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width : view.frame.width, height : view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
