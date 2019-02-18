//
//  ViewController.swift
//  HolaMundo
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 21/01/19.
//  Copyright © 2019 Ayax Alexis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var letrero: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func mostrarLetrero(_ sender: Any) {
        letrero.text="Hola Mundo!!"
    }
    
}

