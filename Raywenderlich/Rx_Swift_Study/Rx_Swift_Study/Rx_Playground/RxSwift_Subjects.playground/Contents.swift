import UIKit
import RxSwift
import RxRelay

/*

 Observable은 기본적으로 읽기 전용
 생성하는 새로운 이벤트에 대한 알림을 받기 위해서만 구독할 수 있다

 실시간으로 Observable에 새로운 값을 수동으로 추가하고 subscriber에게 방출하는 것
 ==> Observable이자 Observer인 것을 subject라고 한다.

 */

/*

 PublishSubject
 받은 정보를 먼저 수정한 다음에 subscriber에게 배포
 구독 이후에 발생하는 이벤트를 받게 된다.
 초기값 X

 비어있는 상태로 시작해서 구독자에게 새 요소만 방출

 */

example(of: "PublishSubject") {
    let disposeBag = DisposeBag()
    let publishSubject = PublishSubject<String>()
    publishSubject.debug().subscribe { print("first subscribe: \($0)") }.disposed(by: disposeBag)
    publishSubject.onNext("1")
    publishSubject.onNext("2")
    publishSubject.debug().subscribe { print("second subscribe: \($0)") }.disposed(by: disposeBag)
    publishSubject.onNext("3")
    publishSubject.onCompleted()

    let subject = PublishSubject<String>()
    subject.onNext("Is anyone listening")
    subject.subscribe(
        onNext: {
            print($0)
        }).disposed(by: disposeBag)
    subject.onNext("1")
    subject.onNext("2")

    let subscriptionTwo = subject
        .subscribe { event in
            print("2) ", event.element ?? event)
        }.disposed(by: disposeBag)
    subject.onNext("3")

    // 이후 이벤트들은 방출하지 않고 completed이벤트만 방출한다.
    subject.onCompleted()


}

/*

 BehaviorSubject
 PublishSubject와 유사하지만 차이점은 초기값을 가진 subject라는 점이다.
 subscribe가 발생 즉시 현재 저장된 값을 이벤트로 방출
 마지막 값을 저장하고 싶을 경우 사용

 초기값으로 시작해서 새 구독자에게 최신 요소 또는 초기값을 방출
 */

example(of: "BehaviorSubject") {
    let disposeBag = DisposeBag()
    let behaviorSubject = BehaviorSubject<String>(value: "tom")
    behaviorSubject.debug("behavior subject log 1 : ").subscribe { print($0) }.disposed(by: disposeBag)
    behaviorSubject.onNext("jack")
    behaviorSubject.debug("behavior subject log 2 : ").subscribe { print($0) }.disposed(by: disposeBag)
    behaviorSubject.debug("behavior subject log 3 : ").subscribe { print($0) }.disposed(by: disposeBag)
    behaviorSubject.onNext("pino")
    behaviorSubject.onCompleted()
    behaviorSubject.onNext("me")
}

// relay
// onNext 대신 accept 사용 (accept 내부에 onNext 구현되어있음)
// error, complete는 보낼수 없고 accept만 보낼수 있다.
// value라는 프로퍼티를 통해 현재 시퀀스의 가장 마지막 element에 접근할 수 있다.
// 필요할때까지 쓰고 dispose를 해준다.
// UI 이벤트에 주로 사용되며 viewModel 보다는 view에 어울림
example(of: "PublishRelay") {
    let relay = PublishRelay<String>()

    let disposeBag = DisposeBag()

    relay.accept("Knock Knock, anyone home?")

    relay
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)

    relay.accept("1")
}
