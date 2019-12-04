//
//  EstimatedTableViewVC.swift
//  EstimatedDemoForSwift
//
//  Created by 杨俊杰 on 2019/12/4.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

import UIKit

class EstimatedTableViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.addSubview(self.mTableView!)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:EstimatedTableCell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! EstimatedTableCell
        cell.indexPath = indexPath;
        return cell
    }
    
    lazy var mTableView:UITableView? = {
       
        let tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.lightGray
        tableView.register(EstimatedTableCell.self, forCellReuseIdentifier: "CELL")
        
        return tableView
    }()
    
    deinit {
        print("页面释放了")
    }
}
