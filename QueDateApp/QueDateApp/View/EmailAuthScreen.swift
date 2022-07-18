//
//  EmailAuthScreen.swift
//  QueDateApp
//
//  Created by Ilya Zelkin on 18.07.2022.
//


import SwiftUI
import Firebase

struct EmailAuthScreen: View {
    @State private var userIsLoggedin = false
    @State private var text = "Already have an acount? Sign In!"
    @State var email = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var attributedStringText: AttributedString {
        var attrS = AttributedString(text)
        let attrT = attrS.range(of: "Sign In!")!
        
        attrS[attrT].foregroundColor = Color("Purple")
        
        return attrS
    }
    
    var body: some View {
        if userIsLoggedin {
            ProfileRegistartionScreen()
        } else {
            
        }
    }
    
    var content: some View {
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
                register()
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
            
            Button {
                login()
                print("Signed In")
            } label: {
                Text(attributedStringText)
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 295, height: 24, alignment: .center)
                    .padding(.top, 20)
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLoggedin.toggle()
                }
            }
        }
    }
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            print("Success")
        } catch (let error) {
            print((error as NSError).code)
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct EmailAuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmailAuthScreen()
    }
}
