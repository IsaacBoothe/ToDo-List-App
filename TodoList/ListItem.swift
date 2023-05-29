//
//  ItemModel.swift
//  TodoList
//
//  Created by Isaac Boothe on 5/23/23.
//

import Foundation

struct ListItem: Identifiable, Equatable {
    var id = UUID()
    var itemName: String
    var checked: Bool = false
}
