//
//  EstimatedCollectionCell.swift
//  EstimatedDemoForSwift
//
//  Created by 杨俊杰 on 2019/12/4.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

import UIKit

class EstimatedCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSubViews() {
        
        self.addSubview(self.imageView_i)
        self.imageView_i.snp_makeConstraints { (make) in
            make.left.top.equalTo(self)
            make.width.equalTo(collecWidth)
            make.right.equalTo(self)
            make.height.equalTo(220.0)
        }
        
        self.addSubview(self.label)
        self.label.snp_makeConstraints { (make) in
            make.top.equalTo(self.imageView_i.snp_bottom).offset(20)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
           
        }
    }
    
    lazy var imageView_i:UIImageView = {
       
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.layer.cornerRadius = 8;
        imageView.layer.masksToBounds = true
        imageView.image = UIImage.init(named: "five_star_comment1")
        return imageView
        
    }()
    
    lazy var label:UILabel = {
       
        let label = UILabel.init(frame: CGRect.zero)
        label.backgroundColor = UIColor.purple
        label.text = "Swift Collection"
        label.font = UIFont.systemFont(ofSize: 15)
        return label;
        
    }()
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let size = self.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = size.width
        newFrame.size.height = size.height
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
}
