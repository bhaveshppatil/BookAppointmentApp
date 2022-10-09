//
//  AboutDoctorTableViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 01/09/22.
//

import UIKit

class AboutDoctorTableViewCell: UITableViewCell {

    @IBOutlet weak var doctorAboutLabel: UILabel!
    @IBOutlet weak var aboutDoctorLabel: UILabel!
    @IBOutlet weak var reviewsView: UIView!
    @IBOutlet weak var workExpView: UIView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var patientLabel: UILabel!
    @IBOutlet weak var workExpLabel: UILabel!
    @IBOutlet weak var patientExpView: UIView!
    @IBOutlet weak var aboutContainerView: UIView!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        containerView.backgroundColor = .clear
        doctorImage.layer.cornerRadius = 15
        aboutContainerView.layer.cornerRadius = 20
        aboutContainerView.applyGradient(colours: [BookAPColors.darkSide, BookAPColors.lightSide])
        aboutContainerView.backgroundColor = BookAPColors.lightSide
        patientExpView.layer.cornerRadius = 20
        workExpView.layer.cornerRadius = 20
        reviewsView.layer.cornerRadius = 20
        patientExpView.backgroundColor = .white
        workExpView.backgroundColor = .white
        reviewsView.backgroundColor = .white
    }
    
    func configureCell(data: DoctorModel?){
        nameLabel.text = data?.name
        specialityLabel.text = data?.speciality
        doctorImage.image = UIImage.init(named: (data?.image)!)
        workExpLabel.text = data?.totalPatient
        patientLabel.text = data?.workExp
        reviewsLabel.text = data?.reviews
        doctorAboutLabel.text = data?.about
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
