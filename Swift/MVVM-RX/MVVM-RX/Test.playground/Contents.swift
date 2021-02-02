import UIKit
import RxSwift

let disposeBag = DisposeBag()

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

Observable<NSNumber>.of(123, 4, 56)
  .map {
    formatter.string(from: $0) ?? ""
  }
  .subscribe(onNext: {
    print($0)
  })
  .disposed(by: disposeBag)
