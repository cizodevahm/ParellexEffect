//
//  ParallaxCell.swift
//  ParellexEffect
//
//  Created by jignesh solanki on 09/10/23.
//

import UIKit

class ParallaxCell: UITableViewCell {

    @IBOutlet weak var ImgTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imgViewBG: UIImageView!

    @IBOutlet weak var lblNumberTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lblNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
