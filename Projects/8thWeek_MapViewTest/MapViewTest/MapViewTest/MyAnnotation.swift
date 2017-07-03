//
//  MyAnnotation.swift
//  MapViewTest
//
//  Created by 정교윤 on 2017. 6. 30..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    
    

}
