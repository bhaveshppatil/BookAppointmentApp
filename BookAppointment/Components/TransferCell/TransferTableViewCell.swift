//
//  TransferTableViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 29/08/22.
//

import UIKit

protocol CatagoriesCellDelegate: AnyObject {
    func didClick(on cellType: CatagoriesCells)
}

class TransferTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstrsint: NSLayoutConstraint!
    private var catagoriesArray = [CatagoriesCells]()
    weak var delegate: CatagoriesCellDelegate?
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }
    
    func registerNib(){
        collectionView?.register(UINib(nibName: "CatagoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CatagoriesCollectionViewCell")
    }
    
    func reloadCell(catagoriesArray: [CatagoriesCells]) {
        self.catagoriesArray = catagoriesArray
        self.collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: -  UICollectionViewDelegate,UICollectionViewDataSource

extension TransferTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catagoriesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoriesCollectionViewCell", for: indexPath) as? CatagoriesCollectionViewCell {
            cell.setData(data: catagoriesArray[indexPath.row].rawValue)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width/4, height: collectionView.frame.size.width/4 + 10)

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didClick(on: catagoriesArray[indexPath.row])
    }
}
