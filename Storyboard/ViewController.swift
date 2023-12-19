//
//  ViewController.swift
//  Storyboard
//
//  Created by Дмитрий Яновский on 16.12.23.
//

import UIKit

class ViewController: UIViewController {

    var lidskoe: Beer = Beer(name: "Лидское", price: 4.5, country: "Лида", volume: 15)
    var alivaria: Beer = Beer(name: "Аливария", price: 3.2, country: "Минск", volume: 29)
    var krinica: Beer = Beer(name: "Крыница", price: 2.8, country: "Минск", volume: 24)
    var rechickoe: Beer = Beer(name: "Речицкое", price: 1.5, country: "Речица", volume: 35)
    
    var lidskoeVolume = 15
    var alibariaVolume = 29
   
    
    @IBOutlet weak var closenShift: UIButton!
    
    @IBAction func closeShift(_ sender: Any) {
        closenView.isHidden = false
        openShift.isHidden = false
    }
    
    @IBOutlet weak var beerCount: UITextField!
    
    @IBOutlet weak var viewLida: UIView!
    
    @IBOutlet weak var viewAlivaria: UIView!
    
    @IBOutlet weak var viewKrinica: UIView!
    
    @IBOutlet weak var viewRechickoe: UIView!
    
    
    @IBOutlet weak var viewMain: UIView!
    
    @IBOutlet weak var lidskoeButton: UIButton!
    
    @IBAction func lidskoeTapped(_ sender: UIButton) {
        lidskoeCount.text = String(lidskoe.volume)
        lidskoePrice.text = String(lidskoe.price)
        revenue.text = String(BeerManager.shared.revenue)
        print("выбрано пиво: \(lidskoe.name)")
       
        if sender.isSelected{
            if lidskoe.volume > 0{
                print("продано пиво: \(lidskoe.name)")
                lidskoe.volume -= 1
                updateVolume(lidskoeCount, withText: lidskoe.volume)
                BeerManager.shared.revenue += lidskoe.price
                revenue.text = String(BeerManager.shared.revenue)
                BeerManager.shared.allBeerCount += 1
                beerCount.text = String(BeerManager.shared.allBeerCount)
               
                
                
            } else {
                print("Пиво закончилось!")
            }
            lidskoeButton.setTitle("Лидское", for: .normal)
            sender.isSelected = false }
        else {
            sender.isSelected = true
            lidskoeButton.setTitle("Продать", for: .normal)
         
        }
    }
    @IBOutlet weak var revenue: UITextField!
    
    @IBOutlet weak var lidskoeCount: UITextField!
    
    @IBOutlet weak var lidskoePrice: UITextField!
    
    
//    Аливария
    @IBOutlet weak var alivariaCount: UITextField!
    
    @IBOutlet weak var alivariaPrice: UITextField!
    
    @IBOutlet weak var alivariaButton: UIButton!
    
    @IBAction func alivariaTapped(_ sender: UIButton) {
        alivariaCount.text = String(alivaria.volume)
        alivariaPrice.text = String(alivaria.price)
        revenue.text = String(BeerManager.shared.revenue)
        print("выбрано пиво: \(alivaria.name)")
        
        if sender.isSelected{
            if alivaria.volume > 0{
                print("продано пиво: \(alivaria.name)")
                alivaria.volume -= 1
                updateVolume(alivariaCount, withText: alivaria.volume)
                BeerManager.shared.revenue += alivaria.price
                revenue.text = String(BeerManager.shared.revenue)

                BeerManager.shared.allBeerCount += 1
                beerCount.text = String(BeerManager.shared.allBeerCount)
                
                
            } else {
                print("Пиво закончилось!")
            }
            alivariaButton.setTitle("Аливария", for: .normal)
            sender.isSelected = false }
        else {
            sender.isSelected = true
            alivariaButton.setTitle("Продать", for: .normal)
            
        }
    }
    
    
    
    
    
    @IBOutlet weak var closenView: UIView!
    
    @IBOutlet weak var closenCount: UILabel!
    
    @IBOutlet weak var ClosenRevenue: UILabel!
    
    
    @IBOutlet weak var openShift: UIButton!
    
    
    @IBAction func openShift(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            print("Смена открыта")
            closenView.isHidden = true
            openShift.isHidden = true
        } else {
            
                sender.isSelected = true
            openShift.setTitle("Открыть смену?", for: .normal)
            BeerManager.shared.revenue = 0.0
            BeerManager.shared.allBeerCount = 0
            revenue.text = String(BeerManager.shared.revenue)
            beerCount.text = String(BeerManager.shared.allBeerCount)
            lidskoe.volume = lidskoeVolume
            alivaria.volume = alibariaVolume
            updateVolume(lidskoeCount, withText: lidskoe.volume)
            updateVolume(alivariaCount, withText: alivaria.volume)
            beerCount.text = String(BeerManager.shared.allBeerCount)
                }
       
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lidskoeVolume = lidskoe.volume
        viewMain.layer.cornerRadius = 35
        viewLida.layer.cornerRadius = 10
        viewLida.layer.borderWidth = 2
        viewAlivaria.layer.cornerRadius = 10
        viewAlivaria.layer.borderWidth = 2
        viewKrinica.layer.cornerRadius = 10
        viewKrinica.layer.borderWidth = 2
        viewRechickoe.layer.cornerRadius = 10
        viewRechickoe.layer.borderWidth = 2
        closenView.layer.cornerRadius = 35
        closenView.layer.borderWidth = 2
        closenView.isHidden = true
        openShift.isHidden = true
        
       
    }

    func updateVolume(_ textField: UITextField, withText text: Int){
        textField.text = String(text)
    }
}

