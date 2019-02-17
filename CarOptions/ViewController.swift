//
//  ViewController.swift
//  CarOptions
//
//  Created by student on 2/17/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winterPkg: UISwitch!
    @IBOutlet weak var carbPkg: UISwitch!
    @IBOutlet weak var towPkg: UISwitch!
    @IBOutlet weak var wheelpkg: UISwitch!
    @IBOutlet weak var logoView: UIImageView!
    
    @IBOutlet weak var outFind: UIButton!
    @IBOutlet weak var outSlider: UISlider!
    @IBOutlet weak var outTow: UISwitch!
    @IBOutlet weak var sliderLabel: UILabel!
    
    
    @IBOutlet weak var winterLBL: UILabel!
    @IBOutlet weak var towLBL: UILabel!
    @IBOutlet weak var wheelLBL: UILabel!
    
    
    
    override func viewDidLoad() {
        sliderLabel.text = "0"
        winterPkg.isEnabled = false
        carbPkg.isEnabled = false
        towPkg.isEnabled = false
        wheelpkg.isEnabled = false
        outSlider.isEnabled = false
        outFind.isEnabled = false
        winterPkg.isOn = false
        carbPkg.isOn = false
        towPkg.isOn = false
        wheelpkg.isOn = false
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
        
    }
    
    @IBAction func carTruckSldr(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // display the car
            
            let mustang: UIImage = UIImage(named: "1977FordMustang.png")!
            logoView.image = mustang
            sliderLabel.text = "36"
            winterPkg.isEnabled = false
            carbPkg.isEnabled = true
            towPkg.isEnabled = false
            wheelpkg.isEnabled = true
            outSlider.isEnabled = true
            outFind.isEnabled = true
            outFind.isEnabled = false
            winterPkg.isOn = false
            carbPkg.isOn = false
            towPkg.isOn = false
            wheelpkg.isOn = false
            towLBL.text = "Tow Package - NOT AVAILABLE"
            winterLBL.text = "Winter Protection - NOT AVAILABLE"
            wheelLBL.text = "Wheel Package"
            outFind.isEnabled = false


            
        } else if sender.selectedSegmentIndex == 1 {
            let highboy: UIImage = UIImage(named:"DW-1607-BIOS-13.png")!
            logoView.image = highboy
            
            sliderLabel.text = "36"
            winterPkg.isEnabled = true
            carbPkg.isEnabled = true
            towPkg.isEnabled = true
            wheelpkg.isEnabled = false
            outSlider.isEnabled = true
            outFind.isEnabled = true
            outFind.isEnabled = false
            winterPkg.isOn = false
            carbPkg.isOn = false
            towPkg.isOn = false
            wheelpkg.isOn = false
            
            wheelLBL.text = "Wheel Package - NOT AVAILABLE"
            towLBL.text = "Tow Package"
            winterLBL.text = "Winter Protection"
            
            outFind.isEnabled = true

            
            
            

        } else {
            let jerry: UIImage = UIImage(named: "Jerrys_FORD_Alexandria_1_-min.png")!
            logoView.image = jerry
            sliderLabel.text = "36"
            winterPkg.isEnabled = false
            carbPkg.isEnabled = true
            towPkg.isEnabled = false
            wheelpkg.isEnabled = true
            outSlider.isEnabled = true
            outFind.isEnabled = true
        }
        
        
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let controller = UIAlertController(title: "Would you like us to call you regarding this vehicle", message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, please find this vehicle!", style: .destructive, handler: { action in
            let msg = "A request was sent to the sales department. Please expect a call within 1 business day!"
            let controller2 = UIAlertController( title: "Request Sent!", message: msg, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Return", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true, completion: nil)
            
        })
        
        let noAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        present(controller, animated: true, completion: nil)
        }
    }
    
    


