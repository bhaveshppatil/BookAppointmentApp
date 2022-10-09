import UIKit

protocol AmbulanceCellDelegate: AnyObject {
    func didGetDirectionClick(_ tag: Int)
     func makeCallToDriver(_ tag: Int)
}

class AmbulanceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerVIew: UIView!
    @IBOutlet weak var btnDirection: UIButton!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ambulanceImgView: UIImageView!
    var delegate: AmbulanceCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    @IBAction func didGetDirectionClick(_ sender: UIButton) {
        delegate?.didGetDirectionClick(sender.tag)
    }
    
    @IBAction func didCallClick(_ sender: UIButton) {
        delegate?.makeCallToDriver(sender.tag)
    }
    
    func setUpViews() {
        containerVIew.addViewBorder(borderColor: BookAPColors.lightSide.cgColor, borderWith: 0.8, borderCornerRadius: 10)
        ambulanceImgView.imageCornerRadius()
    }
    
    func configureCell(data: AmbulanceModel){
        titleLbl.text = data.title
        addressLbl.text = data.address
        ambulanceImgView.image = UIImage.init(named: data.image!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
