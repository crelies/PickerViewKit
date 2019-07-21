//
//  ViewController.swift
//  PickerViewKit_Example
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit
import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var selectedRowModelsLabel: UILabel!
	
    private var manager: PickerViewService?
	
	private let oneSeasonRowModel = SeasonRowModel(identifier: 6, name: "Season 6", description: "Awesome season")
	private lazy var oneSeasonRow: PickerViewRow = {
		return PickerViewRow(type: .plain(title: oneSeasonRowModel.name), model: oneSeasonRowModel)
	}()
	private let anotherSeasonRowModel = SeasonRowModel(identifier: 7, name: "Season 7", description: "Totally awesome season")
	private lazy var anotherSeasonRow: PickerViewRow = {
		return PickerViewRow(type: .plain(title: anotherSeasonRowModel.name), model: anotherSeasonRowModel)
	}()
	private let oneSeasonEpisodes: [PickerViewRow] = Array(1...10).map { number in
		let model = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Episode \(number)")
        let row = PickerViewRow(type: .plain(title: "\(number)"), model: model)
		return row
	}
	private let anotherSeasonEpisodes: [PickerViewRow] = Array(1...7).map { number in
		let model = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Episode \(number)")
        let row = PickerViewRow(type: .plain(title: "\(number)"), model: model)
		return row
	}
	
	private lazy var flagsRow: PickerViewRow = {
		let flagsRowModel = KeyRowModel(identifier: "flags", name: "Flags", description: "Country flags")
		let view: () -> UILabel = {
			let flagsLabel = UILabel()
			flagsLabel.textAlignment = .center
			flagsLabel.textColor = #colorLiteral(red: 0.6293302774, green: 0.741150558, blue: 0.814735353, alpha: 1)
			flagsLabel.text = flagsRowModel.name
			flagsLabel.backgroundColor = #colorLiteral(red: 0.2168482542, green: 0.2507516146, blue: 0.2559372783, alpha: 1)
			return flagsLabel
		}
		return PickerViewRow(type: .custom(view: view), model: AnyPickerViewRowModel(flagsRowModel))
	}()
	
	private lazy var firstFlagRow: PickerViewRow = {
		let firstFlagRowModel = ValueRowModel(identifier: "gb", name: "Kingdom of Great Britain", description: "Everlasting kingdom")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let firstFlagImage = UIImage(named: "GB")
			let firstFlagImageView = UIImageView(image: firstFlagImage)
			firstFlagImageView.frame = frame
			return firstFlagImageView
		}
		return PickerViewRow(type: .custom(view: view), model: AnyPickerViewRowModel(firstFlagRowModel))
	}()
	
	private lazy var secondFlagRow: PickerViewRow = {
		let secondFlagRowModel = ValueRowModel(identifier: "kr", name: "Korea", description: "Part of asian continent")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let secondFlagImage = UIImage(named: "KR")
			let secondFlagImageView = UIImageView(image: secondFlagImage)
			secondFlagImageView.frame = frame
			return secondFlagImageView
		}
		return PickerViewRow(type: .custom(view: view), model: AnyPickerViewRowModel(secondFlagRowModel))
	}()
	
	private lazy var networksRow: PickerViewRow = {
		let networksRowModel = KeyRowModel(identifier: "networks", name: "Networks", description: "List of networks")
		let view: () -> UIView = {
			let networksLabel = UILabel()
			networksLabel.textAlignment = .center
			networksLabel.textColor = #colorLiteral(red: 0.2737779021, green: 0.4506875277, blue: 0.6578510404, alpha: 1)
			networksLabel.text = networksRowModel.name
			networksLabel.backgroundColor = #colorLiteral(red: 0.9962918162, green: 0.4853338599, blue: 0.3247181773, alpha: 1)
			return networksLabel
		}
		return PickerViewRow(type: .custom(view: view), model: AnyPickerViewRowModel(networksRowModel))
	}()
	
	private lazy var githubRow: PickerViewRow = {
		let githubRowModel = ValueRowModel(identifier: "git", name: "Github", description: "Github")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let image = UIImage(named: "github")
			let imageView = UIImageView(image: image)
			imageView.frame = frame
			return imageView
		}
		return PickerViewRow(type: .custom(view: view), model: AnyPickerViewRowModel(githubRowModel))
	}()
	
	private lazy var twitterRow: PickerViewRow = {
		let twitterRowModel = ValueRowModel(identifier: "tweet", name: "Twitter", description: "Twitter")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let image = UIImage(named: "twitter")
			let imageView = UIImageView(image: image)
			imageView.frame = frame
			return imageView
		}
		return PickerViewRow(type: .custom(view: view), model: AnyPickerViewRowModel(twitterRowModel))
	}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		selectedRowModelsLabel.text = ""
		singleColumnExample()
    }
	
	@IBAction private func didPressSingleColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		singleColumnExample()
	}
	
	@IBAction private func didPressKeyValueColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		keyValueColumnExample()
	}
	
	@IBAction private func didPressKeyValueWithImageViewsColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		keyValueWithImageViewsColumnExample()
	}
	
	@IBAction private func didPressMultiColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		multiColumnExample()
	}
}

extension ViewController {
	private func singleColumnExample() {
        var firstPickerViewRow: PickerViewRow {
            let model = ValueRowModel(identifier: "de", name: "Germany", description: "The Republic of Germany")
            let row = PickerViewRow(type: .plain(title: model.name), model: model)
            return row
        }
        var secondPickerViewRow: PickerViewRow {
            let model = ValueRowModel(identifier: "hu", name: "Hungary", description: "Hungary")
            let row = PickerViewRow(type: .plain(title: model.name), model: model)
            return row
        }
        var thirdPickerViewRow: PickerViewRow {
            let model = ValueRowModel(identifier: "lu", name: "Luxembourg", description: "Luxembourg")
            let row = PickerViewRow(type: .plain(title: model.name), model: model)
            return row
        }
        let pickerViewRows = [firstPickerViewRow, secondPickerViewRow, thirdPickerViewRow]
        
        let firstPickerViewColumn = PickerViewColumn(rows: pickerViewRows, columnWidth: 128)
        let pickerViewSetup = PickerViewConfiguration(pickerView: pickerView, columns: [firstPickerViewColumn], delegate: self)
        manager = PickerViewService(setup: pickerViewSetup)
	}
	
	private func keyValueColumnExample() {
        let seasonColumn = PickerViewColumn(rows: [oneSeasonRow, anotherSeasonRow], columnWidth: 96)
        let episodeColumn = PickerViewColumn(rows: oneSeasonEpisodes)
        
        let pickerViewSetup = PickerViewConfiguration(pickerView: pickerView, columns: [seasonColumn, episodeColumn], delegate: self)
        manager = PickerViewService(setup: pickerViewSetup)
	}
	
	private func keyValueWithImageViewsColumnExample() {
        let keyColumn = PickerViewColumn(rows: [flagsRow, networksRow], columnWidth: pickerView.frame.size.width - 56.0)
        let valueColumn = PickerViewColumn(rows: [firstFlagRow, secondFlagRow])
        
        let pickerViewSetup = PickerViewConfiguration(pickerView: pickerView, columns: [keyColumn, valueColumn], delegate: self)
        manager = PickerViewService(setup: pickerViewSetup)
	}
	
	private func multiColumnExample() {
        let days: [PickerViewRow] = Array(1...30).map { number in
            let rowModel = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Day")
            return PickerViewRow(type: .plain(title: "\(number)"), model: rowModel)
        }
        
        let months: [PickerViewRow] = Array(1...12).map { number in
            let rowModel = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Month")
            return PickerViewRow(type: .plain(title: "\(number)"), model: rowModel)
        }
        
        let years: [PickerViewRow] = Array(1990...2000).map { number in
            let rowModel = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Year")
            return PickerViewRow(type: .plain(title: "\(number)"), model: rowModel)
        }
        
        let dayColumn = PickerViewColumn(rows: days)
        let monthColumn = PickerViewColumn(rows: months, columnWidth: 96)
        let yearColumn = PickerViewColumn(rows: years)
        
        let pickerViewSetup = PickerViewConfiguration(pickerView: pickerView, columns: [dayColumn, monthColumn, yearColumn], delegate: self)
        manager = PickerViewService(setup: pickerViewSetup)
	}
}

extension ViewController: PickerViewDelegate {
	func didSelectRow(_ pickerView: UIPickerView,
                      selectedRow: PickerViewRow,
                      allSelectedRows: [PickerViewRow]) {
        if let seasonRowModel = selectedRow.model.value as? SeasonRowModel {
            var selectedRowsLabelText = seasonRowModel.name + " "
            
            switch seasonRowModel.identifier {
                case 6:
                    manager?.updateRows(inColumn: 1, rows: oneSeasonEpisodes)
                    selectedRowsLabelText += (oneSeasonEpisodes[0].model.value as? SeasonRowModel)?.name ?? ""
                
                case 7:
                    manager?.updateRows(inColumn: 1, rows: anotherSeasonEpisodes)
                    selectedRowsLabelText += (anotherSeasonEpisodes[0].model.value as? SeasonRowModel)?.name ?? ""
                
                default: ()
            }
            
            selectedRowModelsLabel.text = selectedRowsLabelText
        } else if let keyRowModel = selectedRow.model.value as? KeyRowModel {
            var selectedRowsLabelText = keyRowModel.name + " "
            
            switch keyRowModel.identifier {
                case "flags":
                    manager?.updateRows(inColumn: 1, rows: [firstFlagRow, secondFlagRow])
                    selectedRowsLabelText += (firstFlagRow.model.value as? ValueRowModel)?.name ?? ""
                
                case "networks":
                    manager?.updateRows(inColumn: 1, rows: [githubRow, twitterRow])
                    selectedRowsLabelText += (githubRow.model.value as? ValueRowModel)?.name ?? ""
                
                default: ()
            }
            
            selectedRowModelsLabel.text = selectedRowsLabelText
        } else {
            let descriptions: [String] = allSelectedRows.compactMap { row in
                return String(describing: row.model.value)
            }
            selectedRowModelsLabel.text = descriptions.joined(separator: " ")
        }
    }
}
