//
//  Category.swift
//  Todoey
//
//  Created by Jack Winterschladen on 05/08/2022.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundColour: String?
    let items = List<Item>()
}
