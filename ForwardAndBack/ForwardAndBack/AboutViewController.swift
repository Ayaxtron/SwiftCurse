//
//  AboutViewController.swift
//  ForwardAndBack
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 2/14/19.
//  Copyright © 2019 Ayax Alexis. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBAction func regresarMain(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
