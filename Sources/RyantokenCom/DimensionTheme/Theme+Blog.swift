//
//  Theme+Blog.swift
//  
//
//  Created by Ryan Token on 03/22/2020.
//

import Publish
import Plot

extension Theme where Site == Blog {
    static var dimension: Self {
        Theme(htmlFactory: TokenHTMLFactory())
    }
}
