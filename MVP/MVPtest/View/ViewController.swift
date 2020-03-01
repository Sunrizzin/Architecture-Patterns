//
//  ViewController.swift
//  MVPtest
//
//  Created by Aleksey Usanov on 01.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import UIKit
//MARK: View - Ничего не знает ни о ком, а только посылает сигналы в презентор
//Требуется инициализировать делегат, для обновления UI от презентора
class ViewController: UIViewController, TrafficLightViewDelegate {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    //Посылка уведомлений в презентор
    @IBAction func redLightAction(_ sender: UIButton) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Red")
    }
    
    @IBAction func yellowLightAction(_ sender: UIButton) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
    }
    
    @IBAction func greenLightAction(_ sender: UIButton) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
    }
    //Метод делегата для обновления UI
    func displayTrafficLight(description: (String)) {
        descriptionLabel.text = description
    }
}

