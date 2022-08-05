//
//  Item.swift
//  Todoey
//
//  Created by Jack Winterschladen on 05/08/2022.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects.init(fromType: Category.self, property: "items")
}
