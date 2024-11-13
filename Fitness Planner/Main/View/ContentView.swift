//
//  ContentView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
       Group{
            if authViewModel.userSession == nil{
                LoginView()
            }else{
                ProfileView()
            }
        }
        .environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}
