//
//  ContentView.swift
//  TodoList
//
//  Created by Isaac Boothe on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showSheet = false
    var body: some View {
        VStack{
            Text("To-Do List:")
                .bold()
                .padding()
                .border(Color.green, width: 3)
                .background(Color.gray)
                .foregroundColor(Color.green)
                .cornerRadius(5)
            
            List{
                ForEach(viewModel.myList) { item in
                    HStack{
                        Text(item.itemName)
                        
                        Spacer()
                        
                        Image(systemName: item.checked ? "checkmark.circle.fill" : "circle")
                            .font(.system(size: 25))
                            .foregroundColor(.green)
                            .onTapGesture {
                                viewModel.checkItem(id: item.id)
                            }
                        
                    }.padding()
                }.onDelete { indexSet in
                    
                    if let index = indexSet.first {
                        viewModel.myList.remove(at: index)
                    }
                }
            }
            
            Button("Add List Item"){
                showSheet.toggle()
            }
            .padding()
            .border(Color.gray, width: 3)
            .background(Color.green)
            .foregroundColor(Color.black)
            .cornerRadius(5)
            
        }.sheet(isPresented: $showSheet) {
            SheetView(viewModel: viewModel, showSheet: $showSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
