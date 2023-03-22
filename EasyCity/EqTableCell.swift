//
//  EqTableCell.swift
//  EasyCity
//
//  Created by tolgahan sonmez on 22.03.2023.
//

import UIKit

class EqTableCell: UITableViewCell {
    
    
    @IBOutlet weak var sehir: UILabel!
    @IBOutlet weak var saat: UILabel!
    @IBOutlet weak var tarih: UILabel!
    @IBOutlet weak var siddet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
