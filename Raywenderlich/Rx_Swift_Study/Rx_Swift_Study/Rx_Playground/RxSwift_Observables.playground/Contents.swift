import UIKit
import RxSwift

/*

 Observable

 일정 기간 동안 이벤트를 생성 ==> 방출
 여기서 이벤트는 숫자 또는 사용자 지정 유형의 인스턴스와 같은 값을 포함하거나 탭과 같은 인식 된 제스처 일 수도 있다.
 구독자가 있을 떄까지 이벤트를 보내거나 작업을 수행하지 않는다

 Observable은 요소를 방출할 때 next 이벤트로 요소를 방출
 이벤트를 모두 내보낸 다음 종료되는데 이를 Completed 이벤트라고 한다.
 오류를 포함한 이벤트를 내보냈을 경우 error 이벤트를 내보내는데 completed가 종료될 때와 동일

 completed나 error 이벤트 발생시 Observable 종료
 => 종료되면 더이상 이벤트를 생성할 수 없다.

 */

example(of: "just, of, from") {
    let one = 1
    let two = 2
    let three = 3

    // just : 오직 하나의 요소를 포함하는 Observable sequence 생성
    let observable = Observable<Int>.just(one)          // Observable<Int>
    // of : 주어진 값들의 타입추론을 통해 Observable sequence 생성
    let observable2 = Observable.of(one, two, three)    // Observable<Int>
    // just와 동일하게 [Int] Observable sequence 생성
    let observable3 = Observable.of([one, two, three])  // Observable<[Int]>
    // from : array 각 요소들을 하나씩 방출
    // array만 사용 가능하다.
    let observable4 = Observable.from([one, two, three])// Observable<Int>
}

example(of: "Subscribe") {
    let one = 1
    let two = 2
    let three = 3

    // subscribe는 escaping 클로저로 Int타입을 event로 갖는다.
    // subscribe는 Disposable을 리턴한다.
    let observable = Observable.of(one, two, three)
    observable.subscribe { event in
        print(event)
    }

    observable.subscribe { event in
        if let element = event.element {
            print(element)
        }
    }

    observable.subscribe(onNext: { element in
        print(element)
    })

    // 만약 요소가 비어있을 경우 completed만 내보낸다
    let emptyObservable = Observable<Void>.empty()
    emptyObservable.subscribe(
        onNext: { element in
            print(element)
        },

        onCompleted: {
            print("Completed")
        }
    )
}

example(of: "range") {
    let observable = Observable<Int>.range(start: 1, count: 10)

    observable
        .subscribe(onNext: { i in
            let n = Double(i)

            let fibonacci = Int(
                ((pow(1.61803, n) - pow(0.61803, n)) /
                    2.23606).rounded()
            )

            print(fibonacci)
        }
        )
}

example(of: "dispose") {
    let observable = Observable.of("A", "B", "C")

    let subscription = observable.subscribe { event in
        print(event)
    }
    subscription.dispose()
}

example(of: "DisposeBag") {
    let disposeBag = DisposeBag()
    Observable.of("A", "B", "C")
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

example(of: "Create") {
    enum MyError: Error {
        case anError
    }

    let disposeBag = DisposeBag()

    // Disposable 리턴
    Observable<String>.create { observer in
        observer.onNext("1")
        // observer.onCompleted()      // Completed되면 이후 이벤트는 발생하지 않는다.
        observer.onError(MyError.anError) // 만약 Completed 대신 error가 와도 이후 이벤트는 발생하지 않는다.
        observer.onNext("?")        // 방출 안됨

        return Disposables.create() // Disposed
    }
    .subscribe(
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") })
    .disposed(by: disposeBag)
}

example(of: "deferred") {
    let disposeBag = DisposeBag()

    var flip = false

    let factory: Observable<Int> = Observable.deferred {

        flip.toggle()

        if flip {
            return Observable.of(1,2,3)
        } else {
            return Observable.of(4,5,6)
        }
    }

    for _ in 0...3 {
        factory.subscribe(onNext: {
            print($0, terminator: "")
        })
        .disposed(by: disposeBag)

        print()
    }
}

/*

 Single
     success와 error이벤트를 내보낸다.
     success : next + completed 조합
     주로 데이터를 다운로드하거나 디스크에서 로드 할 때와 같이 성공하고 값을 산출하거나 실패하는 일회성 프로세스에 유용

 Completable
    completed 또는 error 이벤트만 내보낸다 -> 어떠한 값도 방출하지 않는다.
    파일 쓰기와 같이 작업이 성공적으로 완료되거나 실패한 경우에만 completable 사용

 Maybe
    Single과 Completable의 매쉬업
    success, completed, error중 하나를 방출할 수 있다.

 */

example(of: "Single") {
    let disposeBag = DisposeBag()

    enum FileReadError: Error {
        case fileNotFound, unreadable, encodingFailed
    }

    func loadText(from name: String) -> Single<String> {
        return Single.create { single in
            print(single)

            return Disposables.create()
        }
    }

    loadText(from: "Copyright")
}

example(of: "Challenge") {
    let observable = Observable<Any>.never()

    let disposeBag = DisposeBag()

    observable.do(
        onSubscribe: { print("Subscribed")}
    ).debug("never 확인").subscribe(
        onNext: {
            print($0)
        },
        onCompleted: {
            print("Completed")
        })
    .disposed(by: disposeBag)
}
