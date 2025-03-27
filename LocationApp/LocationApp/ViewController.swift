//
//  ViewController.swift
//  LocationApp
//
//  Created by Duc Thien Tran on 2025-03-27.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAndStart()
    }
    
    var pin:MKPointAnnotation?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        if let location = locations.first{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
            map.setRegion(region, animated: true)
            
            if let pin = pin{
                pin.coordinate = center
                
                CLGeocoder().reverseGeocodeLocation(location){
                    (placemarks, error)->Void in
                    
                    if let e = error{
                        print(e)
                        return
                    }
                    
                    if let placemarks = placemarks{
                        if let mark = placemarks.first{
                            let title = "\(mark.name ?? "-")\n\(mark.locality ?? "-")"
                            self.pin?.title = title
                        }
                    }
                }
            }else{
                pin = MKPointAnnotation()
                pin?.coordinate = center
                pin?.title = "My Location"
                map.addAnnotation(pin!)
            }
        }
    }

    func checkAndStart(){
        switch locationManager.authorizationStatus{
        case .authorizedAlways:
            print("Always auth grantd")
            locationManager.startUpdatingLocation( )
        case .authorizedWhenInUse:
            print("When in use auth grantd")
            locationManager.startUpdatingLocation( )
        case .denied, .restricted:
            print("Sorry, no auth grantd")
        default:
            print("We dont know, let's ask!")
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    @IBAction func startLocation(_ sender: Any) {
        checkAndStart()
    }
    
    @IBAction func stopLocation(_ sender: Any) {
        locationManager.stopUpdatingLocation()
        print("Location updates stopped.")    }
}
