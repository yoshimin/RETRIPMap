//
//  ViewController.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/07/19.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa
import SafariServices

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var gpsButton: RoundedButton!
    @IBOutlet weak var searchButton: RoundedButton!
    
    let viewModel = MapViewModel()
    var disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.rx.tap
            .map{ self.mapView.region }
            .bind(to: viewModel.search)
            .disposed(by: disposeBag)
        
        gpsButton.rx.tap
            .bind(to: viewModel.setCenter)
            .disposed(by: disposeBag)
        
        viewModel.userTrackingMode
            .subscribe(onNext: { [weak self] mode in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.mapView.userTrackingMode = mode
            })
            .disposed(by: disposeBag)
        
        viewModel.setCenter
            .subscribe(onNext: { [weak self] mode in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.mapView.setCenter(weakSelf.mapView.userLocation.coordinate, animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel.annotations
            .subscribe(onNext: { [weak self] annotations in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.mapView.removeAnnotations(weakSelf.mapView.annotations)
                weakSelf.mapView.addAnnotations(annotations)
            })
            .disposed(by: disposeBag)
        
        mapView.rx.didSelect
            .bind(to: viewModel.selectedAnnotationView)
            .disposed(by: disposeBag)
        
        viewModel.url
            .subscribe(onNext: { [weak self] urlString in
                guard let weakSelf = self else {
                    return
                }
                
                if !urlString.isEmpty, let url = URL(string: urlString) {
                    let vc = SFSafariViewController(url: url)
                    weakSelf.present(vc, animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
        
//        viewModel.statuses
//            .subscribe(onNext: {
//                print("\($0)")
//            })
//            .disposed(by: disposeBag)
    }
}
