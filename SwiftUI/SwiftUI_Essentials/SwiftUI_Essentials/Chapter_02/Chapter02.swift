//
//  Chapter02.swift
//  SwiftUI_Essentials
//
//  Created by 정진배 on 2021/06/17.
//

import SwiftUI

struct Chapter02: View {
    var body: some View {
        VStack {
            PropertyView()
            VStack {
                Text("Hello, World!")
                    .onAppear(perform: {
                        // 뷰가 나타날 때 수행되는 코드
                    })
                    .onDisappear(perform: {
                        // 뷰가 사라질 때 수행되는 코드
                    })
                Text("Goodbye World")
                // Stack이나 Form에 포함된 여러 뷰를 서로 연결할 경우 하나의 뷰처럼 간주
                Text("Hello, ") + Text("How ") + Text("are you?")
                MyHStackView()
            }
            Text("Text 5")
                .font(.custom("Copperplate", size: 70))
                .foregroundColor(.red)
                .padding()
                .border(Color.black)
            Button(action: buttonPressed, label: {
                Text("Click Me")
            })
            Button(action: {
                // 동작할 코드
                print("Event Handler For Closure")
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            Button(action: {
                print("Event Handler For Closure")
            }, label: {
                // 텍스트 대신 이미지뷰를 이용한 버튼 생성
                Image(systemName: "square.and.arrow.down")
            })
            MyStack {
                Text("Text 1")
                Text("Text 2")
                HStack {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
            }
        }
    }
}

struct MyStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            content()
        })
        .font(.largeTitle)
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text 3")
                .modifier(StandardTitle())
            Text("Text 4")
        }
    }
}

struct PropertyView: View {
    let carStack = HStack {
        Text("Car Image2")
        Image(systemName: "car.fill")
    }

    var body: some View {
        VStack {
            Text("Main Title")
                .font(.largeTitle)
                .foregroundColor(.red)
            carStack
            Text("Text 1")
                .modifier(StandardTitle())
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}

func buttonPressed() {
    // 동작할 코드
    print("Event Handler For Method")
}

struct Chapter02_Previews: PreviewProvider {
    static var previews: some View {
        Chapter02()
    }
}
