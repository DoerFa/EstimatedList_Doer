//
//  ViewController.swift
//  EstimatedDemoForSwift
//
//  Created by 杨俊杰 on 2019/12/4.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView!)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CELL")
        }
        
        let labelText:String = (indexPath.row == 0) ? "TableView 自适应" : "CollectionView 自适应"
        cell?.textLabel?.text = labelText
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.controllerArray[indexPath.row], animated: true)
    }
    
    
    lazy var tableView:UITableView? = {
        
        let mTableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.backgroundColor = UIColor.darkGray
        return mTableView
        
    }()
    
    lazy var esTableVc:EstimatedTableViewVC = {
        let estabVc = EstimatedTableViewVC()
        return estabVc
    }()
    
    lazy var esCollecVc:EstimatedCollectionVC = {
        let esCollecVc = EstimatedCollectionVC()
        return esCollecVc
    }()
    
    
    lazy var controllerArray:Array = {
        return [self.esTableVc,self.esCollecVc]
    }()

}

