//
//  ViewController.swift
//  map-section10
//
//  Created by NAVJOT SINGH on 2022-03-14.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager:CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 10 meter
        locationManager.distanceFilter = 10
        
        locationManager.delegate = self
        // Do any additional setup after loading the view.
        mapView.isRotateEnabled =  true
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true
        mapView.showsScale =  true
        //        mapView.is
        
        // 45.568096432376585, -73.58917967966816
        let coordinates = CLLocationCoordinate2D.init(latitude: 45.568096432376585, longitude: -73.58917967966816)
        
        
        let region = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinates
        
        annotation.title = "home"
        
        mapView.addAnnotation(annotation)
        
        mapView.delegate = self
        
        locationManager.startUpdatingLocation()
        
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "reuse")
        
        annotation.canShowCallout = true
        annotation.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure)
        
        return annotation
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        
        guard let annotation = view.annotation else {
            return
        }
        
        let url = "http://maps.apple.com/?ll=\(annotation.coordinate.latitude),\(annotation.coordinate.longitude)"
        
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func gotoLocation(_ sender: Any) {
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location \(String(describing: locations.last))")
        
        guard let location = locations.last else {
            return
        }
        
        let coordinates = CLLocationCoordinate2D.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        
        let region = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinates
        
        annotation.title = "Current location"
        // mapView.an
        mapView.addAnnotation(annotation)
        
        if location.horizontalAccuracy < self.locationManager.desiredAccuracy{
            
            // even if service enable then stop updates
            if CLLocationManager.locationServicesEnabled(){
                self.locationManager.stopUpdatingLocation()
            }
            
        }
        
        CLGeocoder().reverseGeocodeLocation(location){ (placeMarks, eroor) in
            if let marks = placeMarks{
                print("Location: \(marks.count)")
                print("Location: \(marks.first?.name)")
            }else{
                
            }
        }
        
    }
    
}

