//
//  PickerViewDataSourceTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewDataSourceTests: QuickSpec {
    override func spec() {
        describe("PickerViewDataSource") {
            context("when initializing with no components") {
                let dataSource = PickerViewDataSource(components: [])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 0
                }
                
                it("should return the correct number of rows in component") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when initializing with 1 component having no rows") {
                let component = PickerViewComponent(rows: [])
                let dataSource = PickerViewDataSource(components: [component])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in component") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when initializing with 1 component having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                let dataSource = PickerViewDataSource(components: [component])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in component") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
            
            context("when initializing with 2 components having no rows") {
                let component1 = PickerViewComponent(rows: [])
                let component2 = PickerViewComponent(rows: [])
                let dataSource = PickerViewDataSource(components: [component1, component2])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in component 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
                
                it("should return the correct number of rows in component 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when initializing with 2 components having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component1 = PickerViewComponent(rows: [row])
                let component2 = PickerViewComponent(rows: [row])
                let dataSource = PickerViewDataSource(components: [component1, component2])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in component 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
                
                it("should return the correct number of rows in component 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                }
            }
            
            context("when updating from zero to 1 component having no rows") {
                let dataSource = PickerViewDataSource(components: [])
                let component = PickerViewComponent(rows: [])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 0
                    dataSource.updateComponents(components: [component])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in component") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateComponents(components: [component])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when updating from zero to 1 component having 1 row") {
                let dataSource = PickerViewDataSource(components: [])
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 0
                    dataSource.updateComponents(components: [component])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in component") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    let component = PickerViewComponent(rows: [row])
                    dataSource.updateComponents(components: [component])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
            
            context("when updating from 2 to 1 component having no rows") {
                let component1 = PickerViewComponent(rows: [])
                let component2 = PickerViewComponent(rows: [])
                let dataSource = PickerViewDataSource(components: [component1, component2])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateComponents(components: [component2])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in component 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateComponents(components: [component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
                
                it("should return the correct number of rows in component 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                    dataSource.updateComponents(components: [component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when updating from 2 to 1 component having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component1 = PickerViewComponent(rows: [row])
                let component2 = PickerViewComponent(rows: [row])
                
                it("should return the correct number of components") {
                    let dataSource = PickerViewDataSource(components: [component1, component2])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateComponents(components: [component2])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in component 1") {
                    let dataSource = PickerViewDataSource(components: [component1, component2])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateComponents(components: [component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
                
                it("should return the correct number of rows in component 2") {
                    let dataSource = PickerViewDataSource(components: [component1, component2])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                    dataSource.updateComponents(components: [component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when updating from 2 to 2 components having no rows") {
                let component1 = PickerViewComponent(rows: [])
                let component2 = PickerViewComponent(rows: [])
                let dataSource = PickerViewDataSource(components: [component1, component2])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateComponents(components: [component2, component1])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in component 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateComponents(components: [component2, component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
                
                it("should return the correct number of rows in component 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                    dataSource.updateComponents(components: [component2, component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when updating from 2 to 2 components having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component1 = PickerViewComponent(rows: [row])
                let component2 = PickerViewComponent(rows: [row])
                let dataSource = PickerViewDataSource(components: [component1, component2])
                
                it("should return the correct number of components") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateComponents(components: [component2, component1])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in component 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateComponents(components: [component2, component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
                
                it("should return the correct number of rows in component 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                    dataSource.updateComponents(components: [component2, component1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                }
            }
            
            context("when updating rows in component from zero to 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [])
                
                it("should return the correct number of rows in component") {
                    let dataSource = PickerViewDataSource(components: [component])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateRows(inComponent: 0, rows: [row])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
            
            context("when updating rows in component from 1 to zero rows") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                
                it("should return the correct number of rows in component") {
                    let dataSource = PickerViewDataSource(components: [component])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateRows(inComponent: 0, rows: [])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when updating rows in component from 1 to 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                
                it("should return the correct number of rows in component") {
                    let dataSource = PickerViewDataSource(components: [component])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateRows(inComponent: 0, rows: [row])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
        }
    }
}
