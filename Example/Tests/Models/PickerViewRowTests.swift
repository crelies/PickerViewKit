//
//  PickerViewRowTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewRowTests: QuickSpec {
    override func spec() {
        describe("PickerViewRow") {
            let model = ""
            
            context("when initializing with type plain") {
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                
                it("should have the type") {
                    expect(row.type) == .plain(title: "Mock")
                }
                
                it("should have a expected model") {
                    expect(row.model) == AnyPickerViewRowModel(model)
                }
                
                it("should have the view") {
                    guard let view = row.view as? UILabel else {
                        fail("View is not an UILabel")
                        return
                    }
                    expect(view.text) == "Mock"
                }
            }
            
            context("when initializing with type attributed") {
                let attributedString = NSAttributedString(string: "Mock")
                let row = PickerViewRow(type: .attributed(title: attributedString), model: model)
                
                it("should have the type") {
                    expect(row.type) == .attributed(title: attributedString)
                }
                
                it("should have a expected model") {
                    expect(row.model) == AnyPickerViewRowModel(model)
                }
                
                it("should have the view") {
                    guard let view = row.view as? UILabel else {
                        fail("View is not an UILabel")
                        return
                    }
                    expect(view.attributedText) == attributedString
                }
            }
            
            context("when initializing with type custom") {
                let imageView = UIImageView()
                let view: () -> UIView = {
                    return imageView
                }
                let row = PickerViewRow(type: .custom(view: view), model: model)
                
                it("should have the type") {
                    expect(row.type) == .custom(view: view)
                }
                
                it("should have expected model") {
                    expect(row.model) == AnyPickerViewRowModel(model)
                }
                
                it("should have the view") {
                    guard let _ = row.view as? UIImageView else {
                        fail("View is not an UIImageView")
                        return
                    }
                }
            }
            
            context("when initializing with type plain and model") {
                let model = MockPickerViewRowModel(name: "MockModel")
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                
                it("should have the type") {
                    expect(row.type) == .plain(title: "Mock")
                }
                
                it("should have the model") {
                    guard let rowModel = row.model.value as? MockPickerViewRowModel else {
                        fail("Row model is not a MockPickerViewRowModel")
                        return
                    }
                    expect(rowModel) == model
                }
                
                it("should have the view") {
                    guard let view = row.view as? UILabel else {
                        fail("View is not an UILabel")
                        return
                    }
                    expect(view.text) == "Mock"
                }
            }
            
            context("when initializing with type attributed and model") {
                let attributedString = NSAttributedString(string: "Mock")
                let model = MockPickerViewRowModel(name: "MockModel")
                let row = PickerViewRow(type: .attributed(title: attributedString), model: model)
                
                it("should have the type") {
                    expect(row.type) == .attributed(title: attributedString)
                }
                
                it("should have the model") {
                    guard let rowModel = row.model.value as? MockPickerViewRowModel else {
                        fail("Row model is not a MockPickerViewRowModel")
                        return
                    }
                    expect(rowModel) == model
                }
                
                it("should have the view") {
                    guard let view = row.view as? UILabel else {
                        fail("View is not an UILabel")
                        return
                    }
                    expect(view.attributedText) == attributedString
                }
            }
            
            context("when initializing with type custom and model") {
                let imageView = UIImageView()
                let view: () -> UIView = {
                    return imageView
                }
                let model = MockPickerViewRowModel(name: "MockModel")
                let row = PickerViewRow(type: .custom(view: view), model: model)
                
                it("should have the type") {
                    expect(row.type) == .custom(view: view)
                }
                
                it("should have the model") {
                    guard let rowModel = row.model.value as? MockPickerViewRowModel else {
                        fail("Row model is not a MockPickerViewRowModel")
                        return
                    }
                    expect(rowModel) == model
                }
                
                it("should have the view") {
                    guard let _ = row.view as? UIImageView else {
                        fail("View is not an UIImageView")
                        return
                    }
                }
            }
        }
    }
}
