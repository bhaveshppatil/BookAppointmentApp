//
//  VisitHoursTableViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 08/09/22.
//

import UIKit

class VisitHoursTableViewCell: UITableViewCell {

    @IBOutlet weak var heightForCollectionView: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var hoursList: VisitHour!
    var currentSelected:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }
    
    func registerNib(){
        collectionView?.register(UINib(nibName: "VisitHoursCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VisitHoursCollectionViewCell")
    }
    
    func reloadCell(hoursList: VisitHour) {
        self.hoursList = hoursList
        self.collectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

// MARK: -  UICollectionViewDelegate,UICollectionViewDataSource
extension VisitHoursTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hoursList.hour!.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VisitHoursCollectionViewCell", for: indexPath) as? VisitHoursCollectionViewCell {
            guard let hourText = hoursList.hour else {
                return cell
            }
            cell.containerView.backgroundColor = currentSelected == indexPath.row ? BookAPColors.darkSide : UIColor.clear
            cell.setupData(hours: hourText[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width/5 + 10, height: collectionView.frame.size.width/5 - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.row
        collectionView.reloadData()
    }
}

