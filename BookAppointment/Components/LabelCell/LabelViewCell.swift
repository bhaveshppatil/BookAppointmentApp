//
//  LabelViewCell.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 29/08/22.
//

import UIKit

class LabelViewCell: UITableViewCell {

    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textLabelView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configureCell(data : String) {
        textLabelView.text = data
        textLabelView.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    public func setCellShadow() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 4
        containerView.layer.shadowColor = BookAPColors.shadowColor.cgColor
        containerView.layer.masksToBounds = false
    }
    
}
