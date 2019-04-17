//
//  RxChildViewModel.swift
//  RxController
//
//  Created by Meng Li on 04/16/2019.
//  Copyright (c) 2019 MuShare. All rights reserved.
//

import RxSwift
import RxCocoa

open class RxChildViewModel: RxViewModel {
    
    weak var _parentEvents: PublishRelay<RxControllerEvent>?
    
    public func accept(event: RxControllerEvent) {
        _parentEvents?.accept(event)
    }
    
    public var parentEvents: Observable<RxControllerEvent> {
        guard let events = _parentEvents else {
            Log.debug("No prerent events found in \(type(of: self))!")
            return Observable.just(.none)
        }
        return events.asObservable()
    }
    
}
