//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by yunus olgun on 4.02.2021.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedPerson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedPerson?.name
        jobLabel.text = selectedPerson?.job
        imageView.image = selectedPerson?.image
        
    }
    

  

}
