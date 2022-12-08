//
//  HomeView.swift
//  Restart
//
//  Created by Serhan Khan on 30.10.22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all , edges: .all)
            VStack(spacing: 20) {
                
                // MARK: - HEADER
                Spacer()
                
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(Animation.easeOut(duration: 4)
                            .repeatForever()
                                   , value: isAnimating)
                }
                
                
                //MARK: - CENTER
                Text("The time that leads to mastery is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //MARK: - FOOTER
                Spacer()
                    .font(.largeTitle)
                Button(action: {
                    playSound(sound: "success", type: "m4a")
                    self.isOnboardingViewActive = true
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                })
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: VSTACK
        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4)))
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
        .preferredColorScheme(.light)
    }//: ZSTACK
        
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
