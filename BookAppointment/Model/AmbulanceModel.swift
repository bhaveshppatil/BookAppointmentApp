//
//  AmbulanceModel.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 26/09/22.
//

import Foundation

struct AmbulanceModel {
    let title: String?
    let address: String?
    let latitude: Double?
    let longitude: Double?
    let contact: String?
    let image: String?
}

class AmbulancetData {
    static func getAmbulanceList() -> [AmbulanceModel] {
        let data = [
            AmbulanceModel(title: "OM SAI AMBULANCE SERVICE", address: "Building No 42, Room no 21 Janata Colony Near Adarsh Nagar, Koliwada, Worli, Mumbai, Maharashtra 400030", latitude: 19.0169763, longitude: 72.2871889, contact: "(206) 342-8631", image: "emergency-ambulance"),
            AmbulanceModel(title: "RACHEL AMBULANCE SERVICES", address: "Baby cottage,room no-15 marve road,posari, talao lane, near St anthony church, Malad West, Mumbai, Maharashtra 400095", latitude: 19.0169763, longitude: 72.2871889, contact: "(253) 644-2182", image: "emergency-ambulance"),
            AmbulanceModel(title: "Jan Sahara Ambulance", address: "613, Juhu Azad Nagar, S.R. A. Co-Op-Soc, CD Barfiwala Road, Andheri West, Mumbai, Maharashtra 400058", latitude: 16.42158, longitude: 67.81759, contact: "098207 00800", image: "emergency-ambulance"),
            AmbulanceModel(title: "SUNDER AMBULANCE SERVICE (AC & Non AC)", address: "4, Sunder Chawl, Near Friend Cottage, Orlem, Lourdes Colony, Malad West, Mumbai, Maharashtra 400064", latitude: 31.45141, longitude: 56.72808, contact: "098702 54880", image: "emergency-ambulance"),
            AmbulanceModel(title: "M.A.T.S Ambulance Service", address: " jupiter hospital Eastern Express Highway next to vivana mall, Thane West, Thane, Maharashtra 400601", latitude: 0.42956, longitude: 41.88827, contact: "097680 78078", image: "emergency-ambulance"),
            AmbulanceModel(title: "SRCT Ambulance Services", address: "A-4,Shaheen Chambers, Dawood Baug Rd, near P.K. Jewellers, Andheri West, Mumbai, Maharashtra 400058", latitude: 55.51963, longitude: 16.58887, contact: "098204 35177", image: "emergency-ambulance"),
            AmbulanceModel(title: "Medilift Air Ambulance Services", address: "Kapadia Nagar Main Rd, Kapadia Nagar, Kurla, Mumbai, Maharashtra 400070", latitude: 27.19181, longitude: 15.86076, contact: "073670 20595", image: "emergency-ambulance"),
            AmbulanceModel(title: "Panchmukhi Air Ambulance Services", address: " G-30, DHEERAJ HERITAGE, Milan Subway Rd, MSEB Colony, Santacruz West, Mumbai, Maharashtra 400054", latitude: 51.11641, longitude: 43.33917, contact: "070705 69742", image: "emergency-ambulance"),
            AmbulanceModel(title: "Radha Krishna Ambulance Service", address: "RT-2, Neighborhood Shopping Complex, behind SBI Bank, Sector 4, Nerul, Navi Mumbai, Maharashtra 400706", latitude: 23.17086, longitude: 166.12044, contact: "083694 52048", image: "emergency-ambulance")
            ]
        return data
    }
}
