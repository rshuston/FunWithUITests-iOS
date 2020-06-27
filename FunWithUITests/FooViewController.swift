//
//  FooViewController.swift
//  FunWithUITests
//
//  Created by Robert Huston on 6/26/20.
//  Copyright © 2020 Robert Huston. All rights reserved.
//

import UIKit

class FooViewController: UIViewController {

    @IBAction func doBar(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let barViewController = mainStoryboard.instantiateViewController(identifier: "BarViewController") as BarViewController
        present(barViewController, animated: true, completion: nil)
    }

}
