//
//  ViewController.swift
//  EggTimer
//
//  Created by Elzada Kushbakova on 21/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var minutes: String = "0"
    var minutesCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        timeLabel.text = minutes
    }
  
    @IBAction func sliderChanged(_ sender: UISlider) {
        timeLabel.text = "\(Int(sender.value))"
        minutesCounter = Int(sender.value)
        print(minutesCounter)
    }
    

    @IBAction func buttonsTapped(_ sender: UIButton) {

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(eggState), userInfo: nil, repeats: true)
    
        switch sender.tag{
        case 0:
            reset()
            minutesCounter = 6
        case 1:
            reset()
            minutesCounter = 11
        case 2:
            reset()
            minutesCounter = 16
        default:
            print("button is not found")
        }
     
    }
    
    @objc func eggState(){
        if minutesCounter != 0{
            minutesCounter -= 1
        }else{
            titleLabel.text = "egg is ready"
        }
        timeLabel.text = "\(minutesCounter)"
        slider.value = Float(Int(minutesCounter))
        
    }
    
    
    func reset(){
        timeLabel.text = "0"
        titleLabel.text = "Not ready"
        slider.value = 0
    }
  }



