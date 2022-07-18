//
//  ProfileRegistartionScreen.swift
//  QueDateApp
//
//  Created by Ilya Zelkin on 18.07.2022.
//

import SwiftUI

struct ProfileRegistartionScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Logout")
        }

    }
}

struct ProfileRegistartionScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRegistartionScreen()
    }
}
