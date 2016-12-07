//
//  DefinitionViewController.swift
//  Emoji Dictionary
//
//  Created by Mario Zamora on 12/5/16.
//  Copyright © 2016 tinySEED. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    var emoji = Emoji()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
