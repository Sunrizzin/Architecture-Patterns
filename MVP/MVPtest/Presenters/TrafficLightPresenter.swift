//
//  TrafficLightPresenter.swift
//  MVPtest
//
//  Created by Aleksey Usanov on 01.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import Foundation

protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description: (String))
}
//MARK: Презентор - инициализирует логику из сервиса и вызывает метод делегата
class TrafficLightPresenter {
    
    private let trafficLightService: TrafficLightService
    
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    //Вызывает метод сервиса и передаёт результат в метод делегата
    func trafficLightColorSelected(colorName:(String)) {
        trafficLightService.getTrafficLight(colorName: colorName) { [weak self] trafficLight in
            if let trafficLight = trafficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: trafficLight.descriptioin)
            }
        }
    }
}
