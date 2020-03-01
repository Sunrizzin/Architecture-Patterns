//
//  TrafficLightService.swift
//  MVPtest
//
//  Created by Aleksey Usanov on 01.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import Foundation
//MARK: Сервис логики приложения
//Ничего не знает о View
class TrafficLightService {
    /*
     Функция принимает в качестве параметра цвет,
     перебирает массив элементов и возвращает первое совпадение либо nil
     */
    func getTrafficLight(colorName: (String), callBack: (TrafficLight?) -> Void) {
        let trafficLights = [TrafficLight(colorName: "Red", descriptioin: "Стой"),
                             TrafficLight(colorName: "Green", descriptioin: "Иди"),
                             TrafficLight(colorName: "Yellow", descriptioin: "Подожди")]
        
        if let foundTrafficLight = trafficLights.first(where: {$0.colorName == colorName}) {
            callBack(foundTrafficLight)
        } else {
            callBack(nil)
        }
    }
}
