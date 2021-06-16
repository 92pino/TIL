import UIKit

/*:
# 미리보기
 미리보기 구조체는 프리뷰 캔버스에 있는 뷰로 샘플 데이터를 전달하여 테스트해보는데 유용하다.

---

### 여러 디바이스에서 미리보기 하기
 ```swift
 struct Chapter01_Previews: PreviewProvider {
     static var previews: some View {
         Chapter01()
             .previewDevice(PreviewDevice(rawValue: "iPhone SE"))   // 미리 보고 싶은 디바이스 이름 작성
             .previewDisplayName("iPhone SE")                       // 표시할 이름 작성
     }
 }
 ```

 ### Group 뷰로 그루핑 하여 동시에 여러 디바이스 타입에서 미리보기
 ```swift
 struct Chapter01_Previews: PreviewProvider {
     static var previews: some View {
         // Group으로 묶어서 위와 동일하게 작성
         Group {
             Chapter01()
                 .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                 .previewDisplayName("iPhone SE")

             Chapter01()
                 .previewDevice(PreviewDevice(rawValue: "iPhone 6"))
                 .previewDisplayName("iPhone 6")
         }
     }
 }
 ```

 ### 다크모드로 미리보기
 ```swift
 struct Chapter01_Previews: PreviewProvider {
     static var previews: some View {
         Chapter01()
             .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
             .previewDisplayName("iPhone SE2")
             .environment(\.colorScheme, .dark)
     }
 }
 ```
*/
