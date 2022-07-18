//
//  CreateAnAccountScreen.swift
//  QueDateApp
//
//  Created by Ilya Zelkin on 18.07.2022.
//

import SwiftUI
import ConfettiSwiftUI

struct CreateAnAccountScreen: View {
    @State private var showEmailAuthScreen = false
    @State private var counter: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .rotationEffect(.degrees(-90))
                            .padding()
                    }
                    
                    Spacer()
                }
                Image("QueLogo")
                    .padding(.top, 40)
                    .padding(.bottom)
                
                Text("Sign up to continue")
                    .frame(width: 295, height: 27)
                Spacer()
                Group {
                    Button {
                        self.showEmailAuthScreen.toggle()
                        print("You was signed up with email")
                    } label: {
                        Text("Continue with email")
                            .foregroundColor(.white)
                            .frame(width: 295, height: 56, alignment: .center)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .padding(.top)
                    }
                    .fullScreenCover(isPresented: $showEmailAuthScreen) {
                        EmailAuthScreen()
                    }
                    
                    /*
                    Button {
                        print("You signed up with phone number")
                    } label: {
                        Text("Use phone number")
                            .padding()
                            .frame(width: 295, height: 56)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(UIColor.lightGray), lineWidth: 0.7)
                            )
                            .foregroundColor(Color("Purple"))
                            .padding(.top)
                    }
                     */
                }
                
                Spacer()
                
                HStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.lightGray))
                        .frame(width: 90, height: 1)
                    
                    Text("or sign up with")
                    
                    Rectangle()
                        .foregroundColor(Color(UIColor.lightGray))
                        .frame(width: 90, height: 1)
                }
                
                HStack {
                    ControlButton(icon: "google") {
                        counter += 1
                    }
                    .confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                    
                    ControlButton(icon: "apple") {
                        //
                    }
                    
                    //ControlButton(icon: "tg") {
                        
                    //}
                    
                    LinkButtons(url: URL(string: "https://t.me/QueDateBot")!, image: "tg")
                }
                Spacer()
                
                HStack(spacing: 25) {
                    TermsPrivacyBotton(name: "Terms of use") {
                        print("Terms of use")
                    }
                    
                    TermsPrivacyBotton(name: "Privacy Policy") {
                        print("Privacy Policy")
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

struct LinkButtons: View {
    let url: URL
    let image: String
    
    var body: some View {
        HStack {
            Link(destination: url) {
                Image(image)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
            }
            .frame(width: 64, height: 64)
            .padding(.top)
        }
    }
}

struct TermsPrivacyBotton: View {
    let name: String
    let action: () -> ()
    
    var body: some View {
        HStack {
            Button {
                self.action()
            } label: {
                Text(name)
                    .font(.system(size: 14))
                    .foregroundColor(Color("Purple"))
            }
        }
    }
}

struct ControlButton: View {
    let icon: String
    let action: () -> ()
    
    var body: some View {
        HStack {
            Button {
                self.action()
            } label: {
                Image(icon)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
            }
            .frame(width: 64, height: 64)
            .padding(.top)
        }
    }
}

struct CreateAnAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateAnAccountScreen()
    }
}

