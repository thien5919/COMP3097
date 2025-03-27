//
//  ContentView.swift
//  NavSwiftUI
//
//  Created by Duc Thien Tran on 2025-03-27.
//

import SwiftUI



struct SecondView:View {
    var choice:Choice
    
    var body: some View {
        VStack{
            Text(choice.name)
            Image(systemName: "plus")
            NavigationLink(destination: Text("Third")){
                Text("Third")
            }
        }
    }
}
struct ContentView: View {
    let data = [
        Choice(name:"One"),
        Choice(name:"Two"),
        Choice(name:"Three")
    ]
    
    
    var body: some View {
        NavigationView{
            List(data){
                c in
                NavigationLink(destination: SecondView(choice: c) ){
                    Text(c.name)
                
            }
            
            }
        }
    }
}

#Preview {
    ContentView()
}
