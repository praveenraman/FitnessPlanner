//
//  CreateAccountView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI

struct CreateAccountView: View {
    @State var email: String = ""
    @State var fullname: String = ""
    @State var passworld: String = ""
    @State var confirmPassworld: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
   // @EnvironmentObject var router: Router
    
    init() {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

        }
    var body: some View{
            ZStack{
                Color.init(red: 25/255, green: 26/255, blue: 32/255)
                Image(.bgLogin)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    .opacity(0.3)
                
                    VStack(spacing: 16){
                        titleText
                        Spacer().frame(height: 12)
                        
                        InputView(
                            placeholder: "Email & phone number",
                            text: $email
                        )
                        
                        InputView(
                            placeholder: "Full Name",
                            text: $fullname
                        )
                        
                        InputView(
                            placeholder: "Password",
                            isSecureField: true,
                            text: $passworld
                        )
                        
                        ZStack(alignment: .trailing) {
                            InputView(
                                placeholder: "Confirm your Password",
                                isSecureField: true,
                                text: $confirmPassworld
                            )
                            
                            Spacer()
                            
                            if !passworld.isEmpty && !confirmPassworld.isEmpty{
                                Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(isValidPassword ? Color(.systemGreen): Color(.systemRed))
                            }
                        }
                        
                        Spacer()
                        
                        //MARK: - Create account Button
                        createAccountView
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .safeAreaPadding(.vertical, 100)
               }
            .ignoresSafeArea(.all)
            .navigationTitle("Set up your account")
            .toolbarRole(.editor)
    }
    
    private var titleText: some View{
        Text("Please complete all information to create an account")
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.yellow)
    }

    private var createAccountView: some View{
        Button{
            Task{
               await authViewModel.createUser(email: email, fullName: fullname, password: passworld)
                if !authViewModel.isError{
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }label: {
            Text("Create Account")
        }
        .buttonStyle(CapsuleButton())
    }
    var isValidPassword: Bool {
        confirmPassworld == passworld
    }
}

#Preview {
    CreateAccountView()
        .environmentObject(AuthViewModel())
}
