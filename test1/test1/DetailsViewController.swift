//
//  DetailsViewController.swift
//  test1
//
//  Created by Duc Thien Tran on 2025-03-27.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var choice:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = choice ?? "empty"

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
