//
//  modelo.swift
//  CurrencyBitCoinConverter
//
//  Created by practica on 20/11/17.
//  Copyright © 2017 UTADEO. All rights reserved.
//

import Foundation
struct modelo {
    let currencyArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","MYR","LKR","DJF"]
    
    let Currency = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R", "$", "රු.","Fdj"]
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"

    mutating func currencyArrayFunc() -> Array<String> {
        return currencyArray
    }
    mutating func currencyArrayFunc1() -> Array<String> {
        return Currency
    }
    mutating func currencyFunc2() -> String {
        return baseURL
    }
    
}
