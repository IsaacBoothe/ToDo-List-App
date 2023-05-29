//
//  SheetView.swift
//  TodoList
//
//  Created by Isaac Boothe on 5/23/23.
//

import SwiftUI

struct SheetView: View {
    @StateObject var viewModel: ViewModel
    @Binding var showSheet: Bool
    @State var enteredItem: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("Enter New Item:")
                .font(.title)
            
            TextField("Enter here", text: $enteredItem)
                .padding()
                .multilineTextAlignment(.leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            Spacer()
            
            Button("Add New Item To My List"){
                viewModel.addToList(itemName: enteredItem)
                showSheet = false
            }
            .padding()
            .border(Color.gray, width: 3)
            .background(Color.green)
            .foregroundColor(Color.black)
            .cornerRadius(5)
            
            Spacer()
        }.padding()
    }
}

