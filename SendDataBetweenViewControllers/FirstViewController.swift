//
//  FirstViewController.swift
//  SendDataBetweenViewControllers
//
//  Created by Brian Veitch on 11/21/21.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var textToSend: UITextField!
    @IBOutlet weak var textToReceive: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // set up segue from A to B. Do not do it from the button
    @IBAction func sendButton(_ sender: UIButton) {
        if textToSend.text != "" {
            performSegue(withIdentifier: "fromAtoB", sender: nil)
        }
    }
    
    // prepare segue (ran before segue is completed)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromAtoB" {
            // set up segue to SecondViewController.swift
            let vc = segue.destination as! SecondViewController
            
            // add data to send to second view controller
            // make sure the variable is defined in SecondViewController
            vc.textSentFromFirstController = textToSend.text!
            
            // completion handler
            // runs when data when SecondViewController closes
            vc.completionHandler = { textFromSecondController in
                self.textToReceive.text = textFromSecondController
            }
            
        }
    }
    

}

