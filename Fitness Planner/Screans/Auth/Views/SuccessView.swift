//
//  SuccessView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 11/11/24.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
  //  @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            Image("thank-you")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.teal)
            
            VStack(spacing: 8){
                Text("Check your email")
                    .font(.largeTitle.bold())
                
                Text("we send your password recover instructions to your email")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            Button{
               // router.navigateToRoot()
            }label: {
                Text("OK")
            }
            .buttonStyle(CapsuleButton(bgColor: .cyan, textColor: .white))
            Spacer()
            
            Button{
                dismiss()
               // router.navigateBack()
            }label: {
               ( Text("Did not receive the email? Check your spam filtter, or ")
                .foregroundStyle(.gray))
                +
                Text("try another email address")
                    .foregroundStyle(.teal)
            }
        }
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    SuccessView()
}
