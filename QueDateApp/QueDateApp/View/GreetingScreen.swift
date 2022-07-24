//
//  GreetingScreen.swift
//  QueDateApp
//
//  Created by Ilya Zelkin on 18.07.2022.
//

import SwiftUI

struct GreetingScreen: View {
    @State private var showFullCreateAnAccountScreen = false
    @State private var showFullSignInAccountScreen = false
    @State private var text = "Already have an acount? Sign In!"
    @State private var otherText = "By using the app, you agree to our Terms Of Service & Privacy Policy"
    
    var attributedStringText: AttributedString {
        var attrS = AttributedString(text)
        let attrT = attrS.range(of: "Sign In!")!
        
        attrS[attrT].foregroundColor = Color("Purple")
        
        return attrS
    }
    
    var attributedStringOtherText: AttributedString {
        var attrS = AttributedString(otherText)
        let attrFirstText = attrS.range(of: "Terms Of Service")!
        let attrSecondText = attrS.range(of: "Privacy Policy")!
        
        attrS[attrFirstText].foregroundColor = Color(UIColor.darkGray)
        attrS[attrSecondText].foregroundColor = Color(UIColor.darkGray)
       
        return attrS
    }
    
    var body: some View {
        ZStack {
            VStack {
                Image("woman")
                    .frame(width: 327, height: 270)
                    .padding(.bottom, 30)
                    .padding(.top,100)
                
                Text("Matches")
                    .font(.system(size: 35, weight: .light, design: .default))
                    .foregroundColor(Color("Purple"))
                    .frame(width: 295, height: 36, alignment: .center)
                
                Text("We match you with people that have a large array of similar interests.")
                    .frame(width: 295, height: 42, alignment: .center)
                    .font(.system(size: 17))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                
                Spacer()
                
                Button {
                    self.showFullCreateAnAccountScreen.toggle()
                } label: {
                    Text("Create an account")
                        .foregroundColor(.white)
                        .frame(width: 295, height: 56, alignment: .center)
                        .background(Color("Purple"))
                        .cornerRadius(15)
                        .padding(.top)
                }
                .fullScreenCover(isPresented: $showFullCreateAnAccountScreen) {
                    CreateAnAccountScreen()
                }
                
                //Spacer()
                
                Text(attributedStringText)
                    .font(.caption)
                    .frame(width: 295, height: 24, alignment: .center)
                    .padding(.top, 20)
                    .onTapGesture {
                        print("Hello")
                    }
                
               Spacer()
                
                /*
                Text(attributedStringOtherText)
                    .foregroundColor(.gray)
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .multilineTextAlignment(.center)
                    .frame(width: 295, height: 40, alignment: .center)
                    .padding(7)
                 */
            }
        }
    }
}

struct GreetingScreen_Previews: PreviewProvider {
    static var previews: some View {
        GreetingScreen()
    }
}
