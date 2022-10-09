//
//  DetailLabelTableViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 07/09/22.
//

import UIKit

class DetailLabelTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var heightForCollectionView: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var daysArray : DaysData!
    private var datesArray : DateData!
    var currentSelected:Int?
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }
    
    func registerNib(){
        collectionView?.register(UINib(nibName: "DetailLabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailLabelCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func reloadCell(daysList: DaysData, datesList: DateData) {
        self.daysArray = daysList
        self.datesArray = datesList
        self.collectionView.reloadData()
    }
    
}

// MARK: -  UICollectionViewDelegate,UICollectionViewDataSource

extension DetailLabelTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysArray.dayText!.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailLabelCollectionViewCell", for: indexPath) as? DetailLabelCollectionViewCell {
            guard let dayText = daysArray.dayText, let dateText = datesArray.dateText else {
                return cell
            }
            cell.containerVIew.backgroundColor = currentSelected == indexPath.row ? BookAPColors.darkSide : UIColor.clear
            cell.dateLabel.textColor = currentSelected == indexPath.row ? UIColor.white : BookAPColors.darkSide
            cell.setData(date: dateText[indexPath.row], day: dayText[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width/5, height: collectionView.frame.size.width/5 - 15)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.row
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath){
       
    }
}

