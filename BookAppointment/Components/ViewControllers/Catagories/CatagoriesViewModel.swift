//
//  CatagoriesViewModel.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 23/09/22.
//

import Foundation

protocol CatagoriesViewModelNavigationDelegate {
    func refreshUI()
}

protocol CatagoriesViewModelProtocol {
    var navigationDelegate: CatagoriesViewModelNavigationDelegate? {get set}
    var cardiologistList: [CardiologistModel] {get set}
    var ambulanceList: [AmbulanceModel] {get set}
    var medicineList: [MedicineModel] {get set}

}

class CatagoriesViewModel: CatagoriesViewModelProtocol {
    var navigationDelegate: CatagoriesViewModelNavigationDelegate?
    var cardiologistList: [CardiologistModel] = [CardiologistModel]()
    var ambulanceList: [AmbulanceModel] = [AmbulanceModel]()
    var medicineList: [MedicineModel] = [MedicineModel]()

    func getCardiologistList() {
        let data = CardiologistData.getCardiologistList()
        self.cardiologistList.removeAll()
        self.cardiologistList.append(contentsOf: data)
        self.navigationDelegate?.refreshUI()
    }
    
    func getAmbulanceList() {
        let data = AmbulancetData.getAmbulanceList()
        self.ambulanceList.removeAll()
        self.ambulanceList.append(contentsOf: data)
        self.navigationDelegate?.refreshUI()
    }
    
    func getMedicineList() {
        let data = MedicineData.getMedicineList()
        self.medicineList.removeAll()
        self.medicineList.append(contentsOf: data)
        self.navigationDelegate?.refreshUI()
    }
}
