//
//  ViewController.swift
//  location1Swift
//
//  Created by John Mac on 12/15/15.
//  Copyright © 2015 John Wetters. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate,
    CLLocationManagerDelegate  //add map and location delegate

    
{//begining
    
    
    
    @IBOutlet var mapView: MKMapView!
    //outlet at the beginning

    
    let locationManager = CLLocationManager()
    //initialize location mnanager
    
  
    
    

    override func viewDidLoad() {//view did load begin
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        
        print("request authorization")
        
        self.locationManager.startUpdatingLocation()
        
        print("start updating location")
        
        self.mapView.showsUserLocation = true
        
        
    }//view did load end
    
    
    

    override func didReceiveMemoryWarning() {//over ride begin
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//over ride end
    
    
    // MARK: - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations
        locations: [CLLocation])
    {
        let location = locations.last
        
        print("update last location")
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        print("last latitude = \(location!.coordinate.latitude)")
        print("last longitude = \(location!.coordinate.longitude)")
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        
        print("region set")
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error:Error)
    {
        print("Error: " + error.localizedDescription)
    }


}//end

