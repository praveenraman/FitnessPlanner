//
//  ProfileView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 07/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    //@EnvironmentObject var router: Router
    var body: some View {
        if let currentUser = authViewModel.currentUser{
            List{
                Section {
                    HStack(spacing: 16){
                        Text(currentUser.initial)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 70, height: 70)
                            .background(Color(.lightGray))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text(currentUser.fullName)
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Text(currentUser.email)
                                .font(.subheadline)
                            
                        }
                    }
                }
                
                Section("Accounts"){
                    Button {
                        authViewModel.signOut()
                    }label: {
                        Label{
                            Text("Sign Out")
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(.red)
                            
                        }
                    }
                    Button {
                        Task {
                            await authViewModel.deleteAccount()
                        }
                    }label: {
                        Label{
                            Text("Delete Account")
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.red)
                            
                        }
                    }
                }
            }
        }else{
           ProgressView("Please wait...")
        }

    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
