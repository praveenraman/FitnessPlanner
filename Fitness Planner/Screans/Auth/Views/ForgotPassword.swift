//
//  ForgotPassword.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 11/11/24.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State private var email: String = ""
    @State private var isEmailSent: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
  //  @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack{
            Color.init(red: 25/255, green: 26/255, blue: 32/255)
            Image(.bgLogin)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
                .padding()
                .opacity(0.3)
            VStack(alignment: .leading){
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Reset Password")
                        .font(.largeTitle)
                        .foregroundStyle(.yelloButton)
                    Text("Enter the email associated with your account and we'll send an email with instructions to reset your password")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                }.padding(.bottom, 32)
                InputView(placeholder: "Enter your email", text: $email)
                    .padding(.bottom, 32)
                Button{
                    Task{
                        await authViewModel.resetPassword(by: email)
                        if !authViewModel.isError {
                            isEmailSent = true
                           // router.navigate(to: .emailSent)
                        }
                    }
                }label: {
                    Text("Send Instructions")
                }
                .buttonStyle(CapsuleButton(bgColor: .yelloButton, textColor: .black))
                Spacer()
            }
            .padding()
            .toolbarRole(.editor)
            .safeAreaPadding(.top, 70)
        }
        .foregroundColor(.yelloButton)
        .ignoresSafeArea()
        .navigationDestination(isPresented: $isEmailSent) {
            SuccessView()
        }
        .onAppear{
            email = ""
        }
    }
}

#Preview {
    ForgotPassword()
}
