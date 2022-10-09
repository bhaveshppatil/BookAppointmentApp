
//  ViewController.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 18/08/22.
//

import UIKit

class BookAppointmentViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var letFindLbl: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    var viewModel: BookAppointmentViewModel = BookAppointmentViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.title = "Book Appointment"
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func setupView(){
        topView.applyGradient(colours: [BookAPColors.darkSide, BookAPColors.lightSide])
        topView.backgroundColor = BookAPColors.lightSide
        topView.layer.cornerRadius = 15
        containerView.backgroundColor = .clear
        searchBar.layer.cornerRadius = 15
        searchBar.clipsToBounds = true
        searchBar.searchTextField.backgroundColor = UIColor.white
        letFindLbl.text = "Let's find \nyour top Doctor!"
        self.navigationController?.navigationBar.backgroundColor = BookAPColors.darkSide
        viewModel.navigationDelegate = self
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        viewModel.getDoctorDataList()
        registerNib()
    }
    
    func registerNib() {
        tableView?.register(UINib(nibName : "TransferTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "TransferTableViewCell")
        tableView?.register(UINib(nibName : "LabelViewCell", bundle : Bundle.main), forCellReuseIdentifier: "LabelViewCell")
        tableView.register(UINib(nibName : "DoctorTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "DoctorTableViewCell")

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "SearchBar", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SearchBarViewController") as! SearchBarViewController
        let query = searchBar.text
        vc.viewModel = SearchViewModel(query: query!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - BookAppointmentViewModelNavigationDelegate
extension BookAppointmentViewController: BookAppointmentViewModelNavigationDelegate {
    func routeToAll() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "AllCatagories", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AllViewController") as! AllViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToCardiologist() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Cardiologist", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CardiologistViewController") as! CardiologistViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToMedicine() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Medicine", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MedicineViewController") as! MedicineViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToGeneral() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "General", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "GeneralViewController") as! GeneralViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToAmbulance() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ambulance", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AmbulanceViewController") as! AmbulanceViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToFindClinic() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "FindClinic", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "FindClinicViewController") as! FindClinicViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func refreshUI() {
        viewModel.doctorListCount = viewModel.doctorList.count
        viewModel.UpdateUI()
        tableView.reloadData()
    }
}

// MARK: -  UITableViewDelegate, UITableViewDataSource
extension BookAppointmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.arrayOfCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = self.viewModel.arrayOfCells[indexPath.row]
        switch cells {
            case .cellCatagoriesTitle:
                let identifier = "LabelViewCell"
                guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? LabelViewCell else { fatalError("The dequeued cell is not an instance of LabelCell.") }
                cell.textLabelView.textAlignment = .left
                cell.configureCell(data: "Catagories")
                cell.backgroundColor = .clear
                return cell
            case .cellTransfer :
                let identifier = "TransferTableViewCell"
                if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TransferTableViewCell {
                    cell.delegate = self
                    cell.reloadCell(catagoriesArray: viewModel.catagoriesArray)
                    cell.backgroundColor = .clear
                    return cell
                }
            case  .availableDoctorTitleCell:
                let identifier = "LabelViewCell"
                guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? LabelViewCell else { fatalError("The dequeued cell is not an instance of LabelCell.") }
                cell.configureCell(data: "Available Doctors")
                cell.textLabelView.textAlignment = .left
                cell.backgroundColor = .clear
                return cell
            case .cellDoctorData:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorTableViewCell", for: indexPath) as? DoctorTableViewCell else {
                    return UITableViewCell()
                }
                let isIndexvalid = viewModel.doctorList.indices.contains(indexPath.row -  3)
                if isIndexvalid {
                    
                    let data = viewModel.doctorList[indexPath.row - 3]
                    cell.configureCell(data: data)
                }
                cell.selectionStyle = .none
                return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= 3 {
            routeToDoctorDetails(index: indexPath.row - 3)
        }
    }
    
    private func routeToDoctorDetails(index: Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DoctorDetails", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        let isValidIndex = viewModel.doctorList.indices.contains(index)
        if isValidIndex {
            let data = viewModel.doctorList[index]
            vc.viewModel = DoctorDetailViewModel(doctorDetailsList: data)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension BookAppointmentViewController: CatagoriesCellDelegate {
    func didClick(on cellType: CatagoriesCells) {
        viewModel.didClick(on: cellType)
    }
}
