//
//  DetailsViewController.swift
//  StoryB
//
//  Created by SaltedFish on 2025-02-13.
//

import UIKit

class DetailsViewController: UIViewController {
    
    

    @IBOutlet weak var choiceLabel: UILabel!
    
    var choice:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        choiceLabel.text = choice ?? "empty"
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
