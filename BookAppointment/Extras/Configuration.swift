//
//  Configuration.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 29/08/22.
//

import Foundation
import UIKit
import MapKit

typealias ConstraintsInfo = (top :Int, bottom :Int, leading :Int, trailing :Int)

class OpenMaps {
    
    // Presenting Action Sheet with Map Options Like Google And Apple Maps.
    /// - Parameter coordinate: coordinate of destination
    static func presentActionSheetwithMapOption(coordinate: CLLocationCoordinate2D) {
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        // Google MAP URL
        let googleURL = "comgooglemaps://?daddr=\(latitude),\(longitude)&directionsmode=driving"
        let googleItem = ("Google Maps", URL(string:googleURL)!)
        
        // Apple MAP URL
        let appleURL = "maps://?daddr=\(latitude),\(longitude)"
        
        var installedNavigationApps = [("Apple Maps", URL(string:appleURL)!)]
        
        if UIApplication.shared.canOpenURL(googleItem.1) {
            installedNavigationApps.append(googleItem)
        }
        
        if installedNavigationApps.count == 1 {
            if let app = installedNavigationApps.first {
                self.openMap(app: app)
            }
            return
        }
    }
    
    // Open Selected Map
    /// - Parameter app: Selected Map Application Details
    private static func openMap(app: (String, URL)) {
        guard UIApplication.shared.canOpenURL(app.1) else {
            debugPrint("Unable to open the map.")
            return
        }
        UIApplication.shared.open(app.1, options: [:], completionHandler: nil)
    }
}
