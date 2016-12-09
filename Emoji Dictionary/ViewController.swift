//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by Mario Zamora on 12/4/16.
//  Copyright © 2016 tinySEED. All rights reserved.
//

import UIKit

// ViewController is a class and we're running peroperties and methods(functions) inside of it

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Tableview outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // Emojis array
    // An array of emoji "objects"
    // emoji will be an array of "Emoji"(class/type)
    
    var emojis : [Emoji] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /* This code gets run the very first time that your app opens up.
         Table views have a datasource and a delegate and this is where it looks to to
         ask questions about what should go inside of the table view. "How many things 
         do I need?", "What should I put inside of each cell?" Both tableView.dataSource = self 
         and tableView.delegate = self look to the view controller for those answers 
         which includes UITableViewDataSource, UITableViewDelegate */
        // tableView is a var outlet we've created (table view we dragged onto the view controller)
        
        tableView.dataSource = self
        tableView.delegate = self
        emojis = makeEmojiArray()
        
    }
    
    // Where the table view gets its answer to "How many rows will I have?"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // returns amount of rows equal to items in the array
        
        return emojis.count
    }
    
    /* Answers the question "What do you want inside of each row in the table view"
     Each row in the tableview is also called a cell.
     "What cell should I show for a given point in the tableview?"
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* In this function we make a new cell, we say this cell's 
         textlabel should have this text inside of it and then we return 
         the answer. Index path has info about what particular point in
        the tableview wants to show. Tableviews and arrays are 0 based counting ()*/
        
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.stringEmoji
        return cell
    }
    
    // Segue: Function runs anytime someone taps on one of the cells inside of the table view
    // Remove highlight from selected items: tableView.deselectRow(at: indexPath, animated: true)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: emoji)
        
    }
    
    /* function gets run right before you move from current
    view controller to the next one */
    // defVC new constant that represents the new definitionViewController
    // defVC is equal to whatever was sent via the sender
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! Emoji
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Created emoji "objects" to be put inside of the array
    // Funtion "returns" an array of emoji "objects"
    
    func makeEmojiArray() -> [Emoji] {
        
        let emoji1 = Emoji()
        emoji1.stringEmoji = "🤔"
        emoji1.definition = "Hmm"
        emoji1.category = "Yellow Person"
        emoji1.createdYear = 2005
        
        let emoji2 = Emoji()
        emoji2.stringEmoji = "👻"
        emoji2.definition = "Boo!"
        emoji2.category = "Category: Fantasy"
        emoji2.createdYear = 1850
        
        let emoji3 = Emoji()
        emoji3.stringEmoji = "🐮"
        emoji3.definition = "Mr. Cow"
        emoji3.category = "Category: Person"
        emoji3.createdYear = 1987
        
        let emoji4 = Emoji()
        emoji4.stringEmoji = "🐷"
        emoji4.definition = "Mrs. Pig"
        emoji4.category = "Category: Sister"
        emoji4.createdYear = 1989
        
        let emoji5 = Emoji()
        emoji5.stringEmoji = "💩"
        emoji5.definition = "Plop!"
        emoji5.category = "Category: Misc."
        emoji5.createdYear = 2016
        
        let emoji6 = Emoji()
        emoji6.stringEmoji = "🦄"
        emoji6.definition = "Nay!"
        emoji6.category = "Category: Fantasy"
        emoji6.createdYear = 1805
        
        return [emoji1, emoji2, emoji3, emoji4, emoji5, emoji6]
        
    }
    
}
