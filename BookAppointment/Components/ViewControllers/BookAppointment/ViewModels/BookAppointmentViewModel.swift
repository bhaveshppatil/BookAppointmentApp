import Foundation

enum BookAppointmentCells {
    case cellCatagoriesTitle
    case cellTransfer
    case availableDoctorTitleCell
    case cellDoctorData
}

enum CatagoriesCells: String {
    case cellAll = "All"
    case cellCardiology = "Cardiology"
    case cellMedicine = "Medicine"
    case cellGeneral = "General"
    case cellAmbulance = "Ambulance"
    case cellFindClicnic = "Find Clinic"
}

protocol BookAppointmentViewModelNavigationDelegate {
    func refreshUI()
    func routeToAll()
    func routeToCardiologist()
    func routeToMedicine()
    func routeToGeneral()
    func routeToAmbulance()
    func routeToFindClinic()
}

protocol BookAppointmentViewModelProtocol {
    var navigationDelegate: BookAppointmentViewModelNavigationDelegate? {get set}
    var arrayOfCells : [BookAppointmentCells] {get set}
    var catagoriesArray : [CatagoriesCells] {get set}
    var doctorList: [DoctorModel]{get set}
    var doctorListCount: Int {get set}
    func UpdateUI()
    func didClick(on cellType: CatagoriesCells)
}

class BookAppointmentViewModel: BookAppointmentViewModelProtocol {
    var navigationDelegate : BookAppointmentViewModelNavigationDelegate?
    var catagoriesArray: [CatagoriesCells] = [.cellAll, .cellCardiology, .cellMedicine, .cellGeneral, .cellAmbulance, .cellFindClicnic]
    var arrayOfCells = [BookAppointmentCells]()
    var doctorList: [DoctorModel] = [DoctorModel]()
    var doctorListCount: Int = 0

    init() {
        
    }
    
    // MARK: -  functions
    func UpdateUI() {
        self.arrayOfCells.removeAll()
        self.arrayOfCells = getCells()
    }
    
    func getCells() -> [BookAppointmentCells] {
        var cell = [BookAppointmentCells]()
        cell.append(.cellCatagoriesTitle)
        cell.append(.cellTransfer)
        
        let count = self.doctorListCount
        if count > 0 {
            cell.append(.availableDoctorTitleCell)
            for _ in 1...count {
                cell.append(.cellDoctorData)
            }
        }
        return cell
    }
    
    func getDoctorDataList() {
        let data = DoctorData.getDoctorList()
        self.doctorList.removeAll()
        self.doctorList.append(contentsOf: data)
        self.navigationDelegate?.refreshUI()
    }
    
    func didClick(on cellType: CatagoriesCells) {
        switch cellType {
            case .cellAll:
                self.navigationDelegate?.routeToAll()
            case .cellCardiology:
                self.navigationDelegate?.routeToCardiologist()
            case .cellMedicine:
                self.navigationDelegate?.routeToMedicine()
            case .cellGeneral:
                self.navigationDelegate?.routeToGeneral()
            case .cellAmbulance:
                self.navigationDelegate?.routeToAmbulance()
            case .cellFindClicnic:
                self.navigationDelegate?.routeToFindClinic()
        }
    }
}
