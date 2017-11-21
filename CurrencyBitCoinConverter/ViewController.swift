//
//  ViewController.swift
//  CurrencyBitCoinConverter
//
//  Created by Practica on 1/11/17.
//  Copyright © 2017 UTADEO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var model = modelo()
    
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    

    var finalURL : String?
    var symbol:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
       
    }
    
    //MARK: - Picker Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.currencyArrayFunc().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.currencyArrayFunc()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(model.currencyArrayFunc()[row])
        
        finalURL = model.baseURL + model.currencyArrayFunc()[row]
        symbol = model.Currency[row]
        getBitcoinData(url: finalURL!)
        
    }

    //MARK: - Networking
    
    func getBitcoinData(url: String)
    {
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess
            {
                let bitcoinJSON : JSON = JSON(response.result.value!)
                self.updateBitcoinData(json: bitcoinJSON)
            }
            else
            {
                print("Error: \(response.result.error)")
                self.labelPrice.text = "Se presento un problema en la conexión"
            }
        }
    }
    
    func updateBitcoinData(json: JSON)
    {
        if let bitcoinResult = json["ask"].double {
            let formater = NumberFormatter()
            formater.groupingSeparator = "."
            formater.numberStyle = .decimal
            let formattedNumber = formater.string(from: bitcoinResult as NSNumber)
            labelPrice.text = symbol!+String(formattedNumber!)
            
        }
        else
        {
            labelPrice.text = "Servicio no Disponible"
        }
    }
}


