//
//  SplashScreenView.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack{
            if isActive == true{
                ContentView()
            }else{
                VStack{
                    VStack {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
         }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.init(cgColor: UIColor(red: 11/255, green: 65/255, blue: 146/255, alpha: 1).cgColor),
            .init(cgColor: UIColor(red: 55/255, green: 48/255, blue: 11/255, alpha: 1).cgColor)]).opacity(0.6))
    }
}

#Preview {
    SplashScreenView()
}
