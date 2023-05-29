//
//  Content-ViewModel.swift
//  TodoList
//
//  Created by Isaac Boothe on 5/23/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var isComplete: Bool = false
    @Published var myList = [ListItem(itemName: "Laundry"), ListItem(itemName: "Mow"), ListItem(itemName: "Trash duty"), ListItem(itemName: "Walk dog"), ListItem(itemName: "Grocery store"), ListItem(itemName: "Go to Dentist")]
    
    func addToList(itemName: String){
        let newItem = ListItem(itemName: itemName)
        withAnimation {
            myList.insert(newItem, at: 0)
        }
    }
    
    func checkItem(id: UUID) {
        let filteredArr = myList.filter { $0.id == id }
        if filteredArr.count > 0 {
            
           let indexOf = myList.firstIndex(of: filteredArr[0])
            if let index = indexOf {
                withAnimation {
                    myList[index].checked.toggle()
                }
                
            }
        }
    }
    
}



