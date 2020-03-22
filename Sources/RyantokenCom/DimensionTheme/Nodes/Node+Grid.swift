//
//  Node+Grid.swift
//  
//
//  Created by Ryan Token on 03/22/2020.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func grid(_ nodes: Node...) -> Node {
        .div(
            .id("layout"),
            .class("pure-g"),
            .group(nodes)
        )
    }
}
