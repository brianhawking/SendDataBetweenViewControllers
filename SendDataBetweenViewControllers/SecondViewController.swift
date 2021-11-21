//
//  SecondViewController.swift
//  SendDataBetweenViewControllers
//
//  Created by Brian Veitch on 11/21/21.
//

import UIKit

class SecondViewController: UIViewController {

    // data sent from FirstViewController will be stored here
    var textSentFromFirstController = ""
    
    // completion handler - used to send data back
    // Data to send back is first parameter (String)
    var completionHandler: ((String) -> Void)?
    
    // outlets
    @IBOutlet weak var textSentFromFirstControllerLabel: UILabel!
    @IBOutlet weak var textSentToFirstController: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // show text sent from first view controller
        textSentFromFirstControllerLabel.text = textSentFromFirstController
        
    }
    
    // prepare data to go back
    @IBAction func sendBack(_ sender: UIButton) {
    
        if textSentToFirstController.text != "" {
           
            completionHandler?(textSentToFirstController.text!)
            
            // use if embedded in navigation controller
            //self.navigationController?.popViewController(animated: true)
       
            // use if regular segue not in navigation controller
            dismiss(animated: true, completion: nil)
        }
    }
    
}
