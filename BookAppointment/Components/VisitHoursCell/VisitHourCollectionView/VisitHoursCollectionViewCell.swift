//
//  VisitHoursCollectionViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 08/09/22.
//

import UIKit

class VisitHoursCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var visitHourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(hours: String) {
        visitHourLabel.text = hours
        containerView.addViewBorder(borderColor: BookAPColors.shadowColor.cgColor, borderWith: 1.0, borderCornerRadius: 10)
    }

}
