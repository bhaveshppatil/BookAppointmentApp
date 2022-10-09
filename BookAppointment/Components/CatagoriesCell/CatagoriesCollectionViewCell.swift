//
//  CatagoriesCollectionViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 29/08/22.
//

import UIKit

class CatagoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var catagoryImageView: UIImageView!
    @IBOutlet weak var catagoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(data: String){
        catagoriesLabel.text = data
        catagoryImageView.image = UIImage.init(named: data)
        imageContainerView.addViewBorder(borderColor: BookAPColors.shadowColor.cgColor, borderWith: 1.0, borderCornerRadius: 10)
        
    }
}
