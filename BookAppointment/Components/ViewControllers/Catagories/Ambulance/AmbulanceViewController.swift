//
//  AmbulanceViewController.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 22/09/22.
//

import UIKit
import MapKit

class AmbulanceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CatagoriesViewModel = CatagoriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        viewModel.getAmbulanceList()
        tableView.delegate = self
        tableView.dataSource = self
        registerNIB()
    }
    
    func registerNIB(){
        tableView.register(UINib(nibName : "AmbulanceTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "AmbulanceTableViewCell")
    }
}

extension AmbulanceViewController: CatagoriesViewModelNavigationDelegate {
    func refreshUI() {
        tableView.reloadData()
    }
}

extension AmbulanceViewController: UITableViewDelegate, UITableViewDataSource, AmbulanceCellDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ambulanceList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AmbulanceTableViewCell", for: indexPath) as? AmbulanceTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.ambulanceList[indexPath.row]
        cell.configureCell(data: data)
        cell.delegate = self
        cell.btnDirection.tag = indexPath.row
        cell.btnCall.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

     }
    
    
    func didGetDirectionClick(_ tag: Int) {
        let data = viewModel.ambulanceList[tag]
        guard let lat = data.latitude, let lon = data.longitude else {return}
        guard let url = URL(string: "maps://?q=Title&ll=\(String(lat)),\(String(lon))") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
//        let coordinate = CLLocationCoordinate2D(latitude: lat,longitude: lon)
//        OpenMaps.presentActionSheetwithMapOption(coordinate: coordinate)
    }
    
    func makeCallToDriver(_ tag: Int) {
        let data = viewModel.ambulanceList[tag]
        guard let contact = data.contact else {return}
        dialNumber(number: contact)
    }
}
