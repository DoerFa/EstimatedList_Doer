//
//  Global.swift
//  EstimatedDemoForSwift
//
//  Created by 杨俊杰 on 2019/12/4.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

let collecWidth = (kScreenWidth - 2)/2



func print<T>(message:T, file:String = #file, line:Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    
    print("\(fileName) : [\(line)] - \(message)")
    #endif
}
