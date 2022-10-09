//
//  SearchBarViewController.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 19/09/22.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: SearchViewModelProtocol!
    let doctorsSpecialities:[DoctorModel] = DoctorData.getDoctorList()
    var filterData:[DoctorModel] = DoctorData.getDoctorList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        searchBar.layer.cornerRadius = 15
        searchBar.clipsToBounds = true
        searchBar.searchTextField.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.text = viewModel.query?.lowercased()
        searchBar(self.searchBar)
        registerNIB()
    }
    
    func registerNIB(){
        tableView.register(UINib(nibName : "DoctorTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "DoctorTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func searchBar(_ searchBar: UISearchBar) {
        let searchText = viewModel.query
        if searchText == "" {
            filterData = doctorsSpecialities
            self.tableView.reloadData()
        }else {
            filterTableView(query: searchText!)
        }
    }
    
    func filterTableView(query: String){
        filterData = doctorsSpecialities.filter({ (item) -> Bool in
            guard let speciality = item.speciality else {return true}
            return speciality.lowercased().contains(query.lowercased())
        })
        self.tableView.reloadData()
    }
}

extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorTableViewCell", for: indexPath) as? DoctorTableViewCell else {
            return UITableViewCell()
        }
        let data = filterData[indexPath.row]
        cell.configureCell(data: data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routeToDoctorDetails(index: indexPath.row)
    }
    
    private func routeToDoctorDetails(index: Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DoctorDetails", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        let data = filterData[index]
        vc.viewModel = DoctorDetailViewModel(doctorDetailsList: data)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchBarViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterData = doctorsSpecialities
            self.tableView.reloadData()
        }else {
            filterCurrentTableView(query: searchText)
        }
    }
    
    func filterCurrentTableView(query: String){
        filterData = doctorsSpecialities.filter({ (item) -> Bool in
            guard let speciality = item.speciality else {return true}
            return speciality.lowercased().contains(query.lowercased())
        })
        self.tableView.reloadData()
    }
}



