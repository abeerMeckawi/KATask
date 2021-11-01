//
//  ViewController.swift
//  KATask
//
//  Created by Abeer Meckawi on 01/11/2021.
//

import UIKit
import ArcGIS

class ViewController: UIViewController, AGSGeoViewTouchDelegate{
    
    @IBOutlet weak var viewMap : AGSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
    
    private func setupMap(){
        let map = AGSMap(basemap: .navigationVector())
        
        viewMap.map = map
        viewMap.touchDelegate = self
        
        viewMap.setViewpoint(
            AGSViewpoint(
                latitude: 34.02700,
                longitude: -118.80500,
                scale: 72_000
            )
        )
    }
    
    func geoView(_ geoView: AGSGeoView, didTapAtScreenPoint screenPoint: CGPoint, mapPoint: AGSPoint) {
        
        if self.viewMap.callout.isHidden {
            viewMap.callout.title = "Name"
            viewMap.callout.detail = "Abeer"
            viewMap.callout.isAccessoryButtonHidden = true
            viewMap.callout.show(at: mapPoint, screenOffset: CGPoint.zero, rotateOffsetWithMap: false, animated: true)
        } else {
            viewMap.callout.dismiss()
        }
        
    }
    
    
}

