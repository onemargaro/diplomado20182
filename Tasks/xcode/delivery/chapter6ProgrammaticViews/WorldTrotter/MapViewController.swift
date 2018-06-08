//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Margaro on 12/04/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
  }
  
  override func loadView() {
//    Create map view
    mapView = MKMapView()
    
//    Set it as the view of this view controller
    view = mapView
    
//    segmented control
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)

//    Constraints
//    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
//    view.sageAreaLayoutGuide.topAnchor updated to ios 11

//    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
  }
  
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .hybrid
    case 2:
      mapView.mapType = .satellite
    default:
      break
    }
  }
}


























