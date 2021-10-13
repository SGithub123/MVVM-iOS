//
//  BookListCell.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 10/10/21.
//

import UIKit

class BookListCell: UITableViewCell {

    @IBOutlet weak var title_Lbl: UILabel!
    
    @IBOutlet weak var detail_Lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
