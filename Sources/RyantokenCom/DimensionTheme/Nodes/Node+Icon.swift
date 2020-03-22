//
//  Node+Icon.swift
//  
//
//  Created by Ryan Token on 03/22/2020.
//

import Plot

extension Node where Context == HTML.AnchorContext {
    static func icon(_ text: String) -> Node {
        return .element(named: "i", attributes: [.class(text + " l-box social-icon")])
    }
}
