//
//  PHPhotoLibrary+rx.swift
//  Combinestagram
//
//  Created by 정진배 on 2020/12/13.
//  Copyright © 2020 Underplot ltd. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension PHPhotoLibrary {
  static var authorized: Observable<Bool> {
    return Observable.create { observer in
      if authorizationStatus() == .authorized {
        observer.onNext(true)
        observer.onCompleted()
      } else {
        observer.onNext(false)
        requestAuthorization { newStatus in
          observer.onNext(newStatus == .authorized)
          observer.onCompleted()
        }
      }
      
      return Disposables.create()
    }
  }
}
