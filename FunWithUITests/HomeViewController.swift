//
//  HomeViewController.swift
//  FunWithUITests
//
//  Created by Robert Huston on 6/26/20.
//  Copyright © 2020 Robert Huston. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var celsiusTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fahrenheitTextField.delegate = self
        celsiusTextField.delegate = self

        // Initialize to common Celsius-Fahrenheit temperature point
        fahrenheitTextField.text = "-40.0"
        celsiusTextField.text = "-40.0"
        
        // Gesture for putting away keyboard when touching outside UITextField
        view.addGestureRecognizer( UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)) )
    }

    // MARK: - UITextFieldDelegate methods

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let temp = Float(text) else { return }

        if textField == fahrenheitTextField {
            let converted = TemperatureConverter.convert(fahrenheit: temp)
            celsiusTextField.text = String(format: "%.1f", converted)
        } else {
            let converted = TemperatureConverter.convert(celsius: temp)
            fahrenheitTextField.text = String(format: "%.1f", converted)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, let temp = Float(text) {
            textField.text = String(format: "%.1f", temp)
        }
        return true
    }

}
