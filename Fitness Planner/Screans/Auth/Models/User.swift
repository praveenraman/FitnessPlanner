//
//  User.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 07/11/24.
//

import Foundation

struct User: Codable {
    let uid: String
    let email: String
    let fullName: String
    
    var initial: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
