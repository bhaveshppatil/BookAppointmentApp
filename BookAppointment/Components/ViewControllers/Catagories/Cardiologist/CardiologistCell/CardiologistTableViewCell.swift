//
//  CardiologistTableViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 22/09/22.
//

import UIKit

class CardiologistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var callDoctorButton: UIButton!
    @IBOutlet weak var feesLbl: UILabel!
    @IBOutlet weak var expYearLbl: UILabel!
    @IBOutlet weak var clinicNameLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()    }
    
    func setUpViews() {
        containerView.addViewBorder(borderColor: BookAPColors.lightGreen.cgColor, borderWith: 0.8, borderCornerRadius: 10)
        doctorImageView.imageCornerRadius()
    }
    
    func configureCell(data: CardiologistModel){
        doctorNameLbl.text = data.name
        clinicNameLbl.text = data.clicnicName
        expYearLbl.text = data.workExp
        ratingLbl.text = data.rating
        feesLbl.text = data.fees
        doctorImageView.image = UIImage.init(named: data.image!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
