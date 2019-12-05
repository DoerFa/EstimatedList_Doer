//
//  EstimatedCollectionVC.swift
//  EstimatedDemoForSwift
//
//  Created by 杨俊杰 on 2019/12/4.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

import UIKit

class EstimatedCollectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLCELL", for: indexPath)
        return cell
    }
    
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.estimatedItemSize = CGSize.init(width: 100, height: 100)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 2
        
        let collecView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collecView.register(EstimatedCollectionCell.self, forCellWithReuseIdentifier: "COLLCELL")
        collecView.delegate = self
        collecView.dataSource = self
        collecView.backgroundColor = UIColor.white
        return collecView;
        
    }()
    
}
