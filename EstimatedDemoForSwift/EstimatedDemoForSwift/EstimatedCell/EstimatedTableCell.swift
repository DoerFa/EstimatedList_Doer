//
//  EstimatedTableCell.swift
//  EstimatedDemoForSwift
//
//  Created by 杨俊杰 on 2019/12/4.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

import UIKit
import SnapKit

class EstimatedTableCell: UITableViewCell {
    
    var iconArr:[String] = ["five_star_comment1","cancleAppresial"]
    
    var _indexPath:IndexPath?
    var indexPath:IndexPath?{
        set{
            _indexPath = newValue
            setCellDates()
        }
        get{
            return _indexPath
        }
    }
    
    func setCellDates() {
        self.label?.text = self.indexPath!.row % 2 == 0 ? sortString : longString
        let randomIcon = Int(arc4random()%2)
        let image = UIImage.init(named: self.iconArr[randomIcon])
        let imageSize = image?.size
        self.imageView_i?.image = image
        self.imageView_i?.snp_remakeConstraints({ (make) in
            make.top.left.equalTo(self).offset(20)
            make.width.equalTo(imageSize!.width)
            make.height.equalTo(imageSize!.height)
        })
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configSubViews()
    }
    
    func configSubViews() {
        self.addSubview(self.imageView_i!)
        self.imageView_i?.snp_makeConstraints({ (make) in
            make.top.left.equalTo(self).offset(20)
            make.width.height.equalTo(80)
        })
        
        self.addSubview(self.label!)
        self.label?.snp_makeConstraints({ (make) in
            make.top.equalTo(self.imageView_i!.snp_bottom).offset(20)
            make.left.equalTo(self.imageView_i!.snp_left)
            make.right.equalTo(self).offset(-20)
            make.bottom.equalTo(self).offset(-20)
        })
    }
    
    
    
//MARK:Lazy
    lazy var imageView_i:UIImageView? = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        return imageView
    }()
    
    lazy var label:UILabel? = {
        let label = UILabel.init(frame: CGRect.zero)
        label.numberOfLines = 0
        label.textColor = UIColor.cyan
        return label
    }()

}
