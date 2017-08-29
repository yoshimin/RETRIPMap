//
//  LocationManager.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/07/20.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa

class LocationManager {
    static let shared = LocationManager()
    
    let authorized: Driver<Bool>
    
    private let locationManager = CLLocationManager()
    
    private init() {
        authorized = Observable.deferred { [weak locationManager] _ -> Observable<CLAuthorizationStatus> in
            let status = CLLocationManager.authorizationStatus()
            
            guard let locationManager = locationManager else {
                return Observable.just(status)
            }
            return locationManager.rx.didChangeAuthorizationStatus
            }
            .asDriver(onErrorJustReturn: .notDetermined)
            .map { status -> Bool in
                switch status {
                case .authorizedWhenInUse:
                    return true
                default:
                    return false
                }
        }
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
