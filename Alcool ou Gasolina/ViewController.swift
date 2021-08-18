//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Pedro Léda on 17/08/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    var textFieldError = ""
    
    // MARK: Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var alcoolPriceTextField: UITextField!
    @IBOutlet weak var gasolinePriceTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK: Initialization
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Actions
    @IBAction func calculateBestPrice(_ sender: Any) {
        if let alcoolPrice = alcoolPriceTextField.text{
            if let gasolinePrice = gasolinePriceTextField.text{
                let result = self.validateTextFields(alcoolPrice: alcoolPrice, gasolinePrice: gasolinePrice)
                
                if result {
                    self.calculatePrice(alcoolPrice: alcoolPrice, gasolinePrice: gasolinePrice)
                }else{
                    resultLabel.text = "Preencha corretamente o campo de \(textFieldError)"
                }
            }
        }
    }
    
    // MARK: Methods
    func calculatePrice(alcoolPrice: String, gasolinePrice: String){
        if let alcoolValue = Double(alcoolPrice){
            if let gasolineValue = Double(gasolinePrice){
                let resultPrice = alcoolValue / gasolineValue
                if resultPrice >= 0.7{
                    self.resultLabel.text = "Melhor utilizar Gasolina!"
                }else{
                    self.resultLabel.text = "Melhor utilizar Álcool!"
                }
            }
        }
    }
    
    func validateTextFields(alcoolPrice: String, gasolinePrice: String) -> Bool{
        var isValidate = true
            textFieldError = ""
        
        if alcoolPrice.isEmpty {
            isValidate = false
            textFieldError = "Álcool"
        }
        if gasolinePrice.isEmpty {
            isValidate = false
            textFieldError = "Gasolina"
        }
        return isValidate
    }
    private func setupUI() {
            setupButton()
        setupLabel()
        }
        
        private func setupButton() {
            calculateButton.layer.cornerRadius = 10
            calculateButton.clipsToBounds = true
        }
    
    private func setupLabel() {
        resultLabel.layer.cornerRadius = 5
        resultLabel.layer.masksToBounds = true
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = UIColor.white.cgColor
    }


}

