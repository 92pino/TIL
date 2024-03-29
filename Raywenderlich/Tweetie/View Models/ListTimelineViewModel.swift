/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

import RealmSwift
import RxSwift
import RxRealm
import RxCocoa

class ListTimelineViewModel {
  private let bag = DisposeBag()
  private let fetcher: TimelineFetcher

  // MARK: - Input
  // view controller가 input을 제공할 수 있게, 일반적인 변수들 또는 subject들과 같은 public 프로퍼티들을 포함한다.

  // MARK: - Output
  // viewModel에 output을 제공하는 모든 프로퍼티(보통 observable)을 포함

  // MARK: - Init
  init(account: Driver<TwitterAccount.AccountStatus>,
       list: ListIdentifier,
       apiType: TwitterAPIProtocol.Type = TwitterAPI.self) {

    // fetch and store tweets
    fetcher = TimelineFetcher(account: account, list: list, apiType: apiType)
    bindOutput()

  }

  // MARK: - Methods
  private func bindOutput() {
    // Bind tweets

    // Bind if an account is available
  }
}
