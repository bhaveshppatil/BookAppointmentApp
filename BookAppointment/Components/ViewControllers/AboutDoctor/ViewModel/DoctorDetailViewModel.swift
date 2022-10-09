//
//  DoctorDetailViewModel.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 02/09/22.
//

import Foundation

enum DatesArray: String {
    case day1 = "5"
    case day2 = "7"
    case day3 = "9"
    case day4 = "11"
    case day5 = "13"
    case day6 = "14"
}

enum DaysArray: String {
    case day1 = "SUN"
    case day2 = "TUE"
    case day3 = "THU"
    case day4 = "SAT"
    case day5 = "MON"
    case day6 = "WED"
}
protocol DoctorDetailNavigationDelegate: AnyObject {
    
}

protocol DoctorDetailViewModelProtocol {
    var navigationDelegate: DoctorDetailNavigationDelegate? {get set}
    var doctorDetailsList: DoctorModel? {get set}
}

class DoctorDetailViewModel: DoctorDetailViewModelProtocol {
    var navigationDelegate: DoctorDetailNavigationDelegate?
    var doctorDetailsList: DoctorModel?
    
    init(doctorDetailsList: DoctorModel) {
        self.doctorDetailsList = doctorDetailsList
    }

}
