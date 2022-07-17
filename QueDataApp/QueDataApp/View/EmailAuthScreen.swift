//
//  EmailAuthScreen.swift
//  QueDataApp
//
//  Created by Ilya Zelkin on 17.07.2022.
//

import SwiftUI

struct EmailAuthScreen: View {
    @State var email = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    print("Back")
                } label: {
                    Image("back")
                }
                .padding()
                
                Spacer()
            }
            
            Text("My Email")
                .font(.system(size: 34))
                .frame(width: 295, height: 51, alignment: .leading)
                .padding(.top, 50)
            
            Text("Please enter your valid phone number. We will send you a code to verify your account.")
                .font(.system(size: 14, weight: .light, design: .default))
                .frame(width: 295, height: 63, alignment: .leading)
                .padding(.bottom)
            
            TextField("Enter Your Valid Email", text: $email)
                .padding()
                .keyboardType(.emailAddress)
                .frame(width: 295, height: 58)
                .background(Color.gray.opacity(0.06))
                .cornerRadius(15)
            
            SecureField("Enter Your Password", text: $password)
                .padding()
                .keyboardType(.asciiCapable)
                .frame(width: 295, height: 58)
                .background(Color.gray.opacity(0.06))
                .cornerRadius(15)
            
            Button {
                print("Continue")
            } label: {
                Text("Continue")
                    .foregroundColor(.white)
                    .frame(width: 295, height: 56, alignment: .center)
                    .background(Color("Purple"))
                    .cornerRadius(15)
                    .padding(.top, 50)
            }

            
            Spacer()
        }
    }
}

struct EmailAuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmailAuthScreen()
    }
}
