//
//  Chapter01.swift
//  SwiftUI_Essentials
//
//  Created by 정진배 on 2021/06/16.
//

import SwiftUI

struct Chapter01: View {
    var body: some View {
        VStack {
            Text("Hello, World!222")
                .font(.largeTitle)
                .foregroundColor(.red)
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct Chapter01_Previews: PreviewProvider {
    static var previews: some View {
        Chapter01()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE2")
            .environment(\.colorScheme, .dark)
    }
}
