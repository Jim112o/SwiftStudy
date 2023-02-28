//
//  NextViewModel.swift
//  SwiftStudy
//
//  Created by Jim on 2023/02/28.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NextViewModel {

    let dismiss = PublishSubject<Void>()
    
    func buttonTapped(){
        dismiss.onNext(())
    }
}
