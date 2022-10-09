//
//  CardiologistModel.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 22/09/22.
//

import Foundation

struct CardiologistModel {
    let name: String?
    let rating: String?
    let image: String?
    let workExp: String?
    let fees: String?
    let clicnicName: String?
    let contact: String?
}

class CardiologistData {
    static func getCardiologistList() -> [CardiologistModel] {
        let data = [
            CardiologistModel(name: "Dr.Ramesh Kawar", rating: "95%", image: "cardiologist5", workExp: "24+ Years", fees: "₹1200", clicnicName: "Riddhi Vinayak Critical Care & Cardiac Centre", contact: "7589342333"),
            CardiologistModel(name: "Dr.G Manoj", rating: "93%", image: "cardiologist4", workExp: "32+ Years", fees: "₹1230", clicnicName: "Good Health Super speciality Clinics & D", contact: "7589342333"),
            CardiologistModel(name: "Dr. Amrita Singh", rating: "96%", image: "cardiologist1", workExp: "22+ Years", fees: "₹900", clicnicName: "Fortis Hospital", contact: "7589342333"),
            CardiologistModel(name: "Dr.C.B. Munjewar", rating: "95%", image: "cardiologist2", workExp: "29+ Years", fees: "₹2500", clicnicName: "FirstHeart Cardiac Super Speciality Centre", contact: "7589342333"),
            CardiologistModel(name: "Dr.Pratiksha G Gandhi", rating: "94%", image: "cardiologist3", workExp: "20+ Years", fees: "₹1100", clicnicName: "IPC Heartcare Centre", contact: "7589342333"),
            CardiologistModel(name: "Dr.Ankur Ulhas Phatarpekar", rating: "88%", image: "cardiologist7", workExp: "16+ Years", fees: "₹1200", clicnicName: "Wockhardt Hospital Mumbai Central", contact: "7589342333"),
            CardiologistModel(name: "Dr. Anil Kaler", rating: "92%", image: "cardiologist5", workExp: "25+ Years", fees: "₹1400", clicnicName: "Pristyn Care Clinic", contact: "7589342333"),
            CardiologistModel(name: "Dr. Purodha Prasad", rating: "96%", image: "cardiologist1", workExp: "40+ Years", fees: "₹3200", clicnicName: "Mission Chronic Cure (Delhi)", contact: "7589342333"),
            CardiologistModel(name: "Dr. Sanjeev Gupta", rating: "97%", image: "cardiologist4", workExp: "31+ Years", fees: "₹2100", clicnicName: "FirstHeart Cardiac Super Speciality Centre", contact: "7589342333"),
            CardiologistModel(name: "Dr. Deepti Agarwal", rating: "95%", image: "cardiologist6", workExp: "19+ Years", fees: "₹1500", clicnicName: "FirstHeart Cardiac Super Speciality Centre", contact: "7589342333"),
            ]
        return data
    }
}
