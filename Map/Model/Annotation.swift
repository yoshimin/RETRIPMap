//
//  Annotation.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/07/24.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}
