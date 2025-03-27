//
//  Choice.swift
//  NavSwiftUI
//
//  Created by Duc Thien Tran on 2025-03-27.
//

import Foundation
struct Choice:Identifiable, Hashable{
    var id = UUID()
    var name:String
    
    func hash(into hasher: inout Hasher){
        hasher.combine(name)
    }
}
