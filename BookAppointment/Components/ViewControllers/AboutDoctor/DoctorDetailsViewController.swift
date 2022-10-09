//
//  AboutDoctorViewController.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 01/09/22.
//

import UIKit

class DoctorDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBookAppointment: UIButton!
    var viewModel: DoctorDetailViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        
    }
    
    func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        btnBookAppointment.applyGradient(colours: [BookAPColors.darkSide, BookAPColors.lightSide])
        btnBookAppointment.backgroundColor = BookAPColors.darkSide
        btnBookAppointment.titleLabel?.textColor = .black
        btnBookAppointment.layer.cornerRadius = 15
        viewModel.navigationDelegate = self
        registerNib()
    }
    
    func registerNib() {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName : "AboutDoctorTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "AboutDoctorTableViewCell")
        tableView?.register(UINib(nibName : "LabelViewCell", bundle : Bundle.main), forCellReuseIdentifier: "LabelViewCell")
        tableView?.register(UINib(nibName : "DetailLabelTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "DetailLabelTableViewCell")
        tableView?.register(UINib(nibName : "VisitHoursTableViewCell", bundle : Bundle.main), forCellReuseIdentifier: "VisitHoursTableViewCell")

    }
}

extension DoctorDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AboutDoctorTableViewCell", for: indexPath) as? AboutDoctorTableViewCell else {
                    return UITableViewCell()
                }
                cell.configureCell(data: viewModel.doctorDetailsList)
                cell.selectionStyle = .none
                return cell
            case 1:
                let identifier = "LabelViewCell"
                guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? LabelViewCell else { fatalError("The dequeued cell is not an instance of LabelCell.") }
                cell.textLabelView.textAlignment = .left
                cell.configureCell(data: "Schedules")
                cell.backgroundColor = .clear
                return cell
                
            case 2 :
                let identifier = "DetailLabelTableViewCell"
                if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DetailLabelTableViewCell {
                    guard let data = viewModel.doctorDetailsList, let days = data.day, let dates = data.date else {
                        return cell
                    }
                    cell.reloadCell(daysList: days, datesList: dates)
                    return cell
                }
                
            case 3:
                let identifier = "LabelViewCell"
                guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? LabelViewCell else { fatalError("The dequeued cell is not an instance of LabelCell.") }
                cell.textLabelView.textAlignment = .left
                cell.configureCell(data: "Visit Hour's")
                cell.backgroundColor = .clear
                return cell
                
            case 4 :
                let identifier = "VisitHoursTableViewCell"
                if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? VisitHoursTableViewCell {
                    guard let data = viewModel.doctorDetailsList, let hours = data.hours else {
                        return cell
                    }
                    cell.reloadCell(hoursList: hours)
                    cell.backgroundColor = .clear
                    return cell
                }
                
            default:
                return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

extension DoctorDetailsViewController: DoctorDetailNavigationDelegate {
    
}
