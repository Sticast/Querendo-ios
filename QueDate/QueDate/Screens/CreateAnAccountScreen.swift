//
//  CreateAnAccountScreen.swift
//  QueDate
//
//  Created by Ilya Zelkin on 14.07.2022.
//  Copyright © 2022 Ilya Zelkin. All rights reserved.
//

import SwiftUI

struct CreateAnAccountScreen: View {
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
                
                Group {
                    Button {
                        print("You was signed up with email")
                    } label: {
                        Text("Continue with email")
                            .foregroundColor(.white)
                            .frame(width: 295, height: 56, alignment: .center)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .padding(.top)
                    }
                    
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
                        //
                    }
                    
                    ControlButton(icon: "apple") {
                        //
                    }
                    
                    ControlButton(icon: "tg") {
                        //
                    }
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
            }
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

