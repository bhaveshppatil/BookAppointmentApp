//
//  DoctorTableViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 30/08/22.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    @IBOutlet weak var containerVIew: UIView!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var specialityLbl: UILabel!
    @IBOutlet weak var appointmentButton: UIButton!
    @IBOutlet weak var doctorNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func configureCell(data: DoctorModel) {
        doctorNameLbl.text = data.name
        specialityLbl.text = data.speciality
        doctorImage.image = UIImage.init(named: data.image!)
        ratingLbl.text = data.rating
    }
    func setupViews(){
        containerVIew.addViewBorder(borderColor: BookAPColors.shadowColor.cgColor, borderWith: 1.0, borderCornerRadius: 10)
        doctorImage.imageCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
