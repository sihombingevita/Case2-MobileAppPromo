//
//  ListPromoTableViewCell.swift
//  MobileAppPromo
//
//  Created by Evita Sihombing on 27/03/24.
//

import UIKit
import AlamofireImage

class ListPromoTableViewCell: UITableViewCell {
 
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var promoNameLbl: UILabel!
    @IBOutlet weak var promoDetailLbl: UILabel!
    
   
    func configure(with promo: Promo) {
        promoNameLbl.text = promo.name
        promoImage.af.setImage(withURL: promo.imageURL)
    }
    
}
