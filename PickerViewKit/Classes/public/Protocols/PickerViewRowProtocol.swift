//
//  PickerViewRowProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 11.04.19.
//  Copyright (c) 2019 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewRowProtocol {
    var type: PickerViewRowType { get }
    var model: PickerViewRowModelProtocol? { get }
    func getView() -> UIView
}

public extension PickerViewRowProtocol {
    func getView() -> UIView {
        switch type {
            case .plain(let title):
                let label = UILabel()
                label.text = title
                return label
            case .attributed(let title):
                let label = UILabel()
                label.attributedText = title
                return label
            case .custom(let view):
                return view()
        }
    }
}
