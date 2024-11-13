//
//  InputView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI

struct InputView: View {
    let placeholder: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 1){
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .padding(.horizontal)
                    .padding(.vertical, 12)
            }else{
                TextField(placeholder, text: $text)
                    .padding(.horizontal)
                    .padding(.vertical, 12)
            }
            Divider()
                .background(.yellow)
        }
        .background(.white)
        .cornerRadius(12.0)
    }
}

#Preview {
    InputView(
        placeholder: "Email & phone number",
        text: .constant("")
    )
}
