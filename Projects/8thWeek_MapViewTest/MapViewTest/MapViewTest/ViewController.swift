//
//  ViewController.swift
//  MapViewTest
//
//  Created by 정교윤 on 2017. 6. 30..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        mapView.delegate = self
        
        // 위도, 경도 -> 좌표를 만들고 좌표 간의 거리를 가지고 span을 만들고 좌표와 span이 모여서 Region이 된다.
        
//        let regionRadius: CLLocationDistance = 1000
//        
//        let location = CLLocation(latitude: 37.517363, longitude: 127.018637) // 서울
//        
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
//        
//        mapView.setRegion(coordinateRegion, animated: true)
        
        let location = CLLocation(latitude: 37.517363, longitude: 127.018637) // 서울
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)// 0.1 => 11Km * 11Km
        
        let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
        mapView.mapType = .standard
        mapView.setRegion(coordinateRegion, animated: true)
        
        let newCoordinate = CLLocationCoordinate2DMake(37.517683, 127.018637)
        
        let customPin = MyAnnotation(title: "Sample", subtitle: "SubSample", coordinate: newCoordinate)
        
        mapView.addAnnotation(customPin)
        
        //locationManager.delegate = self as! CLLocationManagerDelegate
        //locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // 안 쓰는 놈은 queue에 넣었다가 써야 되는 놈은 queue에서 가져온다. (dequeue)
        // callout은 pin을 찍었을 때 뜨는 Title과 Subtitle을 뜨게 만드는 옵션을 말하며 true로 설정하면 보이고 false로 하면 안 보인다.
        if let annotation = annotation as? MyAnnotation {
            let identity = "pin"
            var pinView: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity) as? MKPinAnnotationView
            {
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            } else {
                
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
                pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
                
            }
            
            return pinView
        }
        
        
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // callout action
        
    }
    
    



}

