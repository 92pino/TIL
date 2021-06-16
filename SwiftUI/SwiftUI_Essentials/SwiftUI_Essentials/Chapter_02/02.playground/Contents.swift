import UIKit

/*:

 # 커스텀 수정자
 ViewModifier 프로토콜을 따르는 구조체로 선언

 ex)
 ```
 struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        // 적용하고 싶은 커스텀 UI
        .font(.largeTitle)
        .background(Color.white)
        .border(Color.gray, width: 0.2)
        .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
 }

 // 사용하고 싶은 곳에서 커스텀 수정자 호출
 Text("Text 1")
    .modifier(StandardTitle())
 ```

 ## 이벤트 처리 방법
 1. action에 실행 시킬 메서드를 호출
 2. 액션 함수를 지정하는 대신 실행될 코드를 클로저로 지정

 ```
 1.
 Button(action:EventMethod) {
    // 표시할 UI
    Text("Click Me")
 }

 2.
 Button(action: {
    print("Event")
 }) {
     // 표시할 UI
     Text("Click Me")
 }
 ```

 ## 레이아웃 안에 뷰가 나타나거나 사라질 때 초기화 작업과 초기화 해제 작업을 수행하기 위하여 지정된 뷰에 액션 메서드들 선언
 ```
 Text
    .onAppear(perform: {
        // 뷰가 나타날 때 수행되는 코드
    }
    .onDisAppear(perform: {
        // 뷰가 사라질 때 수행되는 코드
    }
 ```

 ## 
*/
