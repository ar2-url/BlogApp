//
//  PairedView.swift
//  BlogApp
//
//  Created by Artur Knul on 14/08/2023.
//

import SwiftUI

struct PairedView: View {
    let key: String
    let value: String
    var body: some View {
        VStack {
            Text(key)
                .font(.headline)
                .foregroundColor(.cyan)
                .padding()
            Text(value)
                .foregroundColor(.indigo)
        }
    }
}

struct PairedView_Previews: PreviewProvider {
    static var previews: some View {
        PairedView(key:"test", value:"value")
    }
}
