//
//  MedicineViewController.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 22/09/22.
//

import UIKit

class MedicineViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: CatagoriesViewModel = CatagoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - functions
    func setupView(){
        viewModel.getMedicineList()
        collectionView.dataSource = self
        collectionView.delegate = self
        titleLabel.text = "Nearest Medical Store"
        registerNib()
    }
    func registerNib() {
        collectionView?.register(UINib(nibName: "MedicineCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MedicineCellCollectionViewCell")
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MedicineViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MedicineCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MedicineCellCollectionViewCell", for: indexPath) as? MedicineCellCollectionViewCell {
            let data = viewModel.medicineList[indexPath.row]
            cell.delegate = self
            cell.configureCell(data: data)
            cell.btnDirection.tag = indexPath.row
            cell.btnWebsite.tag = indexPath.row
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.medicineList.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func didOpenWebsiteClick(_ tag: Int) {
        let data = viewModel.medicineList[tag]
        guard let url = data.url else {return}
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
    func didOpenDirectionClick(_ tag: Int) {
        let data = viewModel.medicineList[tag]
        guard let lat = data.lat, let lon = data.lon else {return}
        guard let url = URL(string: "maps://?q=Title&ll=\(String(lat)),\(String(lon))") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - FoodViewModelDelegate
extension MedicineViewController : CatagoriesViewModelNavigationDelegate {
    func refreshUI() {
        self.collectionView.reloadData()
    }
}
