//
//  LeapTests.swift
//  LeapTests
//
//  Created by 정진배 on 2021/04/06.
//

import XCTest
import RxSwift
import RxTest
@testable import Leap

class LeapTests: XCTestCase {

    var scheduler: TestScheduler!

    override func setUpWithError() throws {
        // 가상 시간을 구현
        // 마블 다이어그램의 검은색 가로축
        scheduler = TestScheduler(initialClock: 0)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLeap() throws {
        // HotObservable : 구독 여부와 상관 없이 이벤트를 발행
        let xs = scheduler.createHotObservable([
            // 이벤트들을 발생
            // ==> next, completed, error
            // start의 기본 가상시간 200에 구독, 1000에 dispose
            .next(210, "1"),
            .next(230, "2"),
            .next(300, "3"),
            .completed(400)
        ])

        let res = scheduler.start { xs.map { $0 } }
        // res.events의 타입 ==> [Recorded<Event<Element>>]
        print(res.events)

        let correctMessages = Recorded.events(
            .next(210, "1"),
            .next(230, "2"),
            .next(300, "3"),
            .completed(400)
        )

        XCTAssertEqual(res.events, correctMessages)
    }

}
