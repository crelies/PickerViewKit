//
//  PickerViewManagerTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewManagerTests: QuickSpec {
    override func spec() {
        describe("PickerViewManager") {
			context("when initializing with setup") {
				it("should be not nil") {
					do {
						let component = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: UIPickerView(), type: .single(component: component))
						let pickerViewManager = PickerViewManager(setup: setup)
						expect(pickerViewManager).toNot(beNil())
					} catch {
						fail("Could not init PickerViewSetup")
					}
				}
			}
			
			context("when updating from zero to 1 component") {
				it("should have correct number of components in data source") {
					do {
						let pickerView = UIPickerView()
						let component = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: []))
						let manager = PickerViewManager(setup: setup)
						manager.updateComponents(components: [component])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in component") {
					do {
						let pickerView = UIPickerView()
						let component = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: []))
						let manager = PickerViewManager(setup: setup)
						manager.updateComponents(components: [component])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 2 to 1 component") {
				it("should have correct number of components in data source") {
					do {
						let pickerView = UIPickerView()
						let component1 = PickerViewComponent(rows: [])
						let component2 = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component1, component2]))
						let manager = PickerViewManager(setup: setup)
						manager.updateComponents(components: [component1])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in component") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let component1 = PickerViewComponent(rows: [row, row])
						let component2 = PickerViewComponent(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component1, component2]))
						let manager = PickerViewManager(setup: setup)
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateComponents(components: [component1])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 1 to 1 component") {
				it("should have correct number of components in data source") {
					do {
						let pickerView = UIPickerView()
						let component = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						manager.updateComponents(components: [component])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in component") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let component = PickerViewComponent(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateComponents(components: [component])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from zero to 1 row") {
				it("should have correct number of rows in component in data source") {
					do {
						let pickerView = UIPickerView()
						let component = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						
						let row = PickerViewRow(type: .plain(title: "Mock"))
						manager.updateRows(inComponent: 0, rows: [row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in updating component") {
					do {
						let pickerView = UIPickerView()
						let component = PickerViewComponent(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						
						let row = PickerViewRow(type: .plain(title: "Mock"))
						manager.updateRows(inComponent: 0, rows: [row])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 2 to 1 row") {
				it("should have correct number of rows in component in data source") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let component = PickerViewComponent(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateRows(inComponent: 0, rows: [row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in updating component") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let component = PickerViewComponent(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateRows(inComponent: 0, rows: [row])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 2 to 2 rows") {
				it("should have correct number of rows in component in data source") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let component = PickerViewComponent(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateRows(inComponent: 0, rows: [row, row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 2
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in updating component") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let component = PickerViewComponent(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(components: [component]))
						let manager = PickerViewManager(setup: setup)
						
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateRows(inComponent: 0, rows: [row, row])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
        }
    }
}
