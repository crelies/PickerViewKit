//
//  ViewController.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit
import UIKit

struct MyRow: PickerViewRowProtocol {
    var title: String
    var attributedTitle: NSAttributedString?
}

class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var manager: PickerViewManagerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstPickerViewRow = MyRow(title: "First Row", attributedTitle: nil)
        let pickerViewRows = [firstPickerViewRow]
        
        let firstPickerViewComponent = PickerViewComponent(rows: pickerViewRows)
        let pickerViewComponents =  [firstPickerViewComponent]
        manager = PickerViewManager(pickerView: pickerView, components: pickerViewComponents, callback: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: PickerViewDelegateCallbackProtocol {
    func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol) {
        let secondPickerViewRow = MyRow(title: UUID().uuidString, attributedTitle: nil)
        let secondPickerViewComponent = PickerViewComponent(rows: [secondPickerViewRow])
        manager?.updateComponents(components: [secondPickerViewComponent])
    }
}
