//
//  TableViewCell.swift
//  SELENA-SLEDAI
//
//  Created by Georgy on 15.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var checkButton: CheckButton!
    var checkedTag = [Int]()
    @IBOutlet weak var expandThis: UITextView!
    @IBOutlet weak var cellDefinition: UITextView!
    @IBOutlet weak var cellDescriptor: UILabel!
    @IBOutlet weak var cellWt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    @IBAction func CheckButtonAction(_ sender: UIButton) {
        
    }
    
    override func prepareForReuse() {
        expandThis.text = ""
    }
    }

