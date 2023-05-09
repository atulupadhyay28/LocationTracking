//
//  CoordinateData.swift
//  LocationTracking
//
//  Created by user on 29/04/23.
//

import UIKit

class CoordinateData: UITableViewCell {
    @IBOutlet weak var latitudeLbl: UILabel!
    @IBOutlet weak var longitutdeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
