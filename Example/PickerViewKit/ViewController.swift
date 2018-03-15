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

struct SeasonRow: PickerViewRowProtocol {
	var title: String
	var attributedTitle: NSAttributedString?
	
	init(title: String) {
		self.title = title
	}
}

struct EpisodeRow: PickerViewRowProtocol {
	var title: String
	var attributedTitle: NSAttributedString?
	
	init(title: String) {
		self.title = title
	}
}

class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var manager: PickerViewManagerProtocol?
	
	private let sixthSeason = SeasonRow(title: "6")
	private let seventhSeason = SeasonRow(title: "7")
	private let seasonSixEpisodes = [EpisodeRow(title: "1"), EpisodeRow(title: "2"), EpisodeRow(title: "3"), EpisodeRow(title: "4"), EpisodeRow(title: "5"), EpisodeRow(title: "6"), EpisodeRow(title: "7"), EpisodeRow(title: "8"), EpisodeRow(title: "9"), EpisodeRow(title: "10")]
	private let seasonSevenEpisodes = [EpisodeRow(title: "1"), EpisodeRow(title: "2"), EpisodeRow(title: "3"), EpisodeRow(title: "4"), EpisodeRow(title: "5"), EpisodeRow(title: "6"), EpisodeRow(title: "7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		exampleTwo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func exampleOne() {
		let firstPickerViewRow = MyRow(title: "First Row", attributedTitle: nil)
		let pickerViewRows = [firstPickerViewRow]
		
		let firstPickerViewComponent = PickerViewComponent(rows: pickerViewRows)
		let pickerViewComponents =  [firstPickerViewComponent]
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, components: pickerViewComponents, callback: self)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
	
	func exampleTwo() {
		let seasons = PickerViewComponent(rows: [sixthSeason, seventhSeason])
		let episodes = PickerViewComponent(rows: seasonSixEpisodes)
		
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, components: [seasons, episodes], callback: self)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
}

extension ViewController: PickerViewDelegateCallbackProtocol {
    func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol) {
		if let season = row as? SeasonRow {
			switch season.title {
				case "6":
					let seasons = PickerViewComponent(rows: [sixthSeason, seventhSeason])
					let episodes = PickerViewComponent(rows: seasonSixEpisodes)
					let pickerViewSetup = PickerViewSetup(pickerView: pickerView, components: [seasons, episodes], callback: self, defaultColumnWidth: CGFloat(56), defaultRowHeight: CGFloat(96))
					manager = PickerViewManager(setup: pickerViewSetup)
				case "7":
					let seasons = PickerViewComponent(rows: [sixthSeason, seventhSeason])
					let episodes = PickerViewComponent(rows: seasonSevenEpisodes)
					let pickerViewSetup = PickerViewSetup(pickerView: pickerView, components: [seasons, episodes], callback: self, defaultColumnWidth: CGFloat(64), defaultRowHeight: CGFloat(128))
					manager = PickerViewManager(setup: pickerViewSetup)
				default: ()
			}
		} else if let episode = row as? EpisodeRow {
			
		}
    }
}
