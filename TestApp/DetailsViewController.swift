//
//  DetailsViewController.swift
//  TestApp
//
//  Created by jay kumar on 05/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsLabel : UILabel!
    
    var selectedData : ResponseModelClass!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = selectedData.body
        detailsLabel.sizeToFit()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
