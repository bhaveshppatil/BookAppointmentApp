//
//  CardiologistViewController.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 22/09/22.
//

import UIKit

class CardiologistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topDoctorLbl: UILabel!
    @IBOutlet weak var labelContainerView: UIView!
    var viewModel: CatagoriesViewModel = CatagoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        viewModel.getCardiologistList()
        labelContainerView.roundCorners(corners: [.topLeft, .topRight ], radius: 20)
        labelContainerView.clipsToBounds = true
        labelContainerView.applyGradient(colours: [BookAPColors.darkSide,BookAPColors.lightSide])
        labelContainerView.backgroundColor = BookAPColors.lightSide
        topDoctorLbl.text = "Top cardiologist \ndoctor's"
        tableView.delegate = self
        tableView.dataSource = self
        registerNIB()
    }
    
    func registerNIB(){
        tableView.register(UINib(nibName : "CardiologistTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "CardiologistTableViewCell")
    }
}
extension CardiologistViewController: CatagoriesViewModelNavigationDelegate {
    func refreshUI() {
        tableView.reloadData()
    }
}

extension CardiologistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cardiologistList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardiologistTableViewCell", for: indexPath) as? CardiologistTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.cardiologistList[indexPath.row]
        cell.configureCell(data: data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.cardiologistList[indexPath.row]
        dialNumber(number: data.contact!)
    }
}
