//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Даниил Франк on 02.12.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var dayTF: UITextField!
    
    @IBOutlet weak var monthTF: UITextField!
    
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        resultLabel.text = findDayOfTheWeek(day: Int(dayTF.text!), month: Int(monthTF.text!), year: Int(yearTF.text!))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func findDayOfTheWeek(day: Int?, month: Int?, year: Int?) -> String{
        
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        var dateComponents = DateComponents()
        
        guard let day = day, let month = month, let year = year else { return "Incorrect data" }
        
        if day > 31 || month > 12 {
            return "Incorrect data"
        }
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        dateFormatter.dateFormat = "EEEE"
        
        let date = calendar.date(from: dateComponents)
        let weekDay = dateFormatter.string(from: date!)
        
        return weekDay
    }
    
}

