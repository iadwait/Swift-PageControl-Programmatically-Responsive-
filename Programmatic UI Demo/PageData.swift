//
//  PageDataModel.swift
//  Programmatic UI Demo
//
//  Created by Adwait Barkale on 26/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation


struct PageData {
    
    var imageName: String
    var headerTitle: String
    var description: String

    init(imgName:String,hTitle: String,desc: String) {
        imageName = imgName
        headerTitle = hTitle
        description = desc
    }

}

