//
//  LoginView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var passworld: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
   // @EnvironmentObject var router: Router
    
    var body: some View{
        
        NavigationStack {
            ZStack{
                Color.init(red: 25/255, green: 26/255, blue: 32/255)
                Image(.bgLogin)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    .opacity(0.3)
                
                ScrollView(.vertical) {
                    VStack(spacing: 16){
                        logoView
                        titleView
                        Spacer().frame(height: 12)
                        InputView(
                            placeholder: "Email & phone number",
                            text: $email
                        )
                        InputView(
                            placeholder: "Password",
                            isSecureField: true,
                            text: $passworld
                        )
                        
                        //MARK: - Forgot Button
                        
                        forgotView
                        
                        //MARK: - Loging Button
                        
                        loginView
                        Spacer()
                        orDividerView
                        
                        //MARK: - Apple Loging Button
                        
                        appleButtonView
                        
                        //MARK: - Google Loging Button
                        
                        googleButtonView
                        
                        //MARK: - Footer
                        
                        footerButtonView
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .safeAreaPadding(.vertical, 50)
            }
            .ignoresSafeArea()
            .alert("Something went wrong", isPresented: $authViewModel.isError){}
        }
        
    }
    
    private var line: some View {
        VStack{
            Divider().frame(height: 1)
                .background(.yelloButton)
        }
    }
    
    private var logoView: some View{
        Image(.logo)
            .resizable()
            .frame(width: 200, height: 200)
            .scaledToFit()
    }
    private var titleView: some View{
        Text("Welcome to Fitness Planner")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.yellow)
    }
    private var forgotView: some View{
        HStack{
            Spacer()
            
//            Button{
//                router.navigate(to: .forgotPassword)
//            }label: {
//                Text("Forgot Password?")
//                    .foregroundStyle(.yellow)
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//            }
            NavigationLink{
                ForgotPassword()
                    .environmentObject(authViewModel)
            }label: {
                Text("Forgot Password?")
                    .foregroundStyle(.yellow)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
    private var loginView: some View{
        Button{
            Task {
                await authViewModel.loginUser(email: email, password: passworld)
            }
        }label: {
            Text("Login")
        }
        .buttonStyle(CapsuleButton())
    }
    
    private var orDividerView: some View{
        HStack(spacing: 15) {
            line
            Text("or")
                .font(.subheadline)
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.yelloButton)
        
    }
    private var appleButtonView: some View{
        Button{
        }label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        }
        .buttonStyle(CapsuleButton(bgColor: .black, textColor: .white))
        
    }
    private var googleButtonView: some View{
        Button{
        }label: {
            HStack{
                Image("google")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Sign up with Google")
            }
        }
        .buttonStyle(
            CapsuleButton(
                bgColor: .clear,
                textColor: .white,
                hasBorder: true
            )
        )
    }
    private var footerButtonView: some View{
//        Button {
//            router.navigate(to: .createAccount)
//        }label: {
//            HStack{
//                Text("Don't have an account?")
//                    .foregroundStyle(.white)
//                Text("Sing Up")
//                    .foregroundStyle(.yelloButton)
//            }
//            .fontWeight(.bold)
//        }
        
        NavigationLink(destination: {
            CreateAccountView()
                .environmentObject(authViewModel)
        }, label: {
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(.white)
                Text("Sing Up")
                    .foregroundStyle(.yelloButton)
            }
            .fontWeight(.bold)
        })
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
