

import UIKit

protocol MedicineCellDelegate: AnyObject {
    func didOpenWebsiteClick(_ tag: Int)
    func didOpenDirectionClick(_ tag: Int)

}
class MedicineCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btnDirection: UIButton!
    @IBOutlet weak var btnWebsite: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var medicalImage: UIImageView!
    @IBOutlet weak var containerVIew: UIView!
    var delegate: MedicineCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    @IBAction func didWebsiteClick(_ sender: UIButton) {
        delegate?.didOpenWebsiteClick(sender.tag)
    }
    
    @IBAction func didDirectionClick(_ sender: UIButton) {
        delegate?.didOpenDirectionClick(sender.tag)
    }
    
    func setupViews(){
        containerVIew.addViewBorder(borderColor: UIColor.gray.cgColor, borderWith: 0.8, borderCornerRadius: 10)
        medicalImage.imageCornerRadius()
    }
    
    func configureCell(data: MedicineModel) {
        title.text = data.title
        medicalImage.image = UIImage.init(named: data.image!)
    }

}
