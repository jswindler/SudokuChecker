//
//  ViewController.swift
//  SudokuChecker
//
//  Created by Joe Swindler on 9/28/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let GridSize = 9
  var sudokuGrid: [[Int]] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  func populateGrid(filename: String) {
    // load file into dictionary
    var error: NSError?
    let fileData: NSData? = NSData(contentsOfFile: filename)
    if fileData != nil {
      var gridDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(fileData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
      
      
      for (var row: Int = 0; row < GridSize; row++) {
        for (var column: Int = 0; column < GridSize; column++) {
          
        }
      }
    }
    
    
    if let json = NSJSONSerialization.JSONObjectWithData(fileData, options: nil, error: &error) as? [String: AnyObject],
      feed = json["feed"] as? [String: AnyObject],
      entries = feed["entry"] as? [[String: AnyObject]]
    {
      for entry in entries {
        if let name = entry["im:name"] as? [String: AnyObject],
          label = name["label"] as? String {
            titles.append(label)
        }
      }
    }
    
  }


}

