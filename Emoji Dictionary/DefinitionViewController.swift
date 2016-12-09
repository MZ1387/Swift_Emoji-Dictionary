//
//  DefinitionViewController.swift
//  Emoji Dictionary
//
//  Created by Mario Zamora on 12/5/16.
//  Copyright © 2016 tinySEED. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    // New view controller for the large emogi with definitions that we segue to
    // New file > Cocoa Touch Class
    // Connect view controller (yellow circle) with identity inspector > Class
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    
    // 
    
    var emoji = Emoji()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // This is the code that shows the emoji and definitions that are passed through
        // When loading the "Outlets" will receive the "object" properties created in Emoji class
        
        emojiLabel.text = emoji.stringEmoji
        definitionLabel.text = emoji.definition
        categoryLabel.text = "Category: \(emoji.category)"
        createdLabel.text = "Created: \(emoji.createdYear)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
