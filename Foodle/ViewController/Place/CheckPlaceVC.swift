//
//  CheckPlaceVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit
import MapKit

class CheckPlaceVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setMap(lati: 37.4003065, longi: 127.106973)
    }
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "unwindTemp", sender: self)
    }
    
    func setMap(lati: Double, longi: Double){
        let location = CLLocationCoordinate2DMake(lati, longi)
        let region = MKCoordinateRegionMakeWithDistance(location, 10, 10)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(FoodlePlaceAnnotation(name: "멋진 음식점!", location: location))
        
    }
    
}

class FoodlePlaceAnnotation: NSObject, MKAnnotation{
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, location: CLLocationCoordinate2D) {
        title = name
        subtitle = "여기가 맞나요?"
        coordinate = location
    }
    
}
