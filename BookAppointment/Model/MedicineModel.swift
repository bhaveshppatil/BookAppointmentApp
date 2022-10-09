//
//  MedicineModel.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 28/09/22.
//

import Foundation

struct MedicineModel {
    let title: String?
    let image: String?
    let url: String?
    let lat: Double?
    let lon: Double?
}

class MedicineData {
    static func getMedicineList() -> [MedicineModel] {
        let data = [
            MedicineModel(title: "NEELKANTH GENERICPLUS PHARMA MEDICINE STORE", image: "medical1", url: "https://all-india-medical-stores.business.site/?utm_source=gmb&utm_medium=referral", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Poonam Medical & General Stores", image: "medical2", url: "https://mymedi.store/neelkanthpharma", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "GENERIC MEDICAL STORES", image: "medical3", url: "https://genericmedicalstores.business.site/", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Aradhana Medical & General Stores", image: "medical4", url: "", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Venus medical and general store", image: "medical5", url: "https://venus-medical-tardeo.business.site/?utm_source=gmb&utm_medium=referral", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Amar Medical Stores", image: "medical6", url: "", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "All India Medical Stores", image: "medical7", url: "https://all-india-medical-stores.business.site/?utm_source=gmb&utm_medium=referral", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Manish Medical Stores", image: "medical8", url:"http://www.wellnessforever.in/", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Shree Gajanan Medical Stores", image: "medical3", url:"http://www.facebook.com/sgmssion", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "New Royal Chemist", image: "medical1", url: "http://newroyalchemistandheri.business.site/", lat: 28.6302475, lon: 76.7960999),
            MedicineModel(title: "Kolekar Medical Stores", image: "medical5", url: "http://business.google.com/website/kolekar-medical-stores", lat: 28.6302475, lon: 76.7960999)
            ]
        return data
    }
}
