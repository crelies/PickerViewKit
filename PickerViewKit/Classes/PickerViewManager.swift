//
//  PickerViewManager.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public protocol PickerViewManagerProtocol {
    var dataSource: PickerViewDataSourceProtocol { get }
    var delegate: PickerViewDelegateProtocol { get }
    init(pickerView: UIPickerView, components: [PickerViewComponent], callback: PickerViewDelegateCallbackProtocol)
    func updateComponents(components: [PickerViewComponent])
}

public final class PickerViewManager: PickerViewManagerProtocol {
    public var dataSource: PickerViewDataSourceProtocol
    public var delegate: PickerViewDelegateProtocol
    private weak var pickerView: UIPickerView?
    
    public init(pickerView: UIPickerView, components: [PickerViewComponent], callback: PickerViewDelegateCallbackProtocol) {
        self.pickerView = pickerView
        let dataSource = PickerViewDataSource(components: components)
        self.dataSource = dataSource
        
        let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback)
        self.delegate = delegate
        
        pickerView.dataSource = dataSource
        pickerView.delegate = delegate
        
        pickerView.reloadAllComponents()
    }
    
    public func updateComponents(components: [PickerViewComponent]) {
        dataSource.updateComponents(components: components)
        pickerView?.reloadAllComponents()
    }
}
