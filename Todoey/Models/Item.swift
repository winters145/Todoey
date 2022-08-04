//
//  Item.swift
//  Todoey
//
//  Created by Jack Winterschladen on 04/08/2022.
//

import Foundation

struct Item: Encodable {
    
    var title: String = ""
    var done: Bool = false
}
