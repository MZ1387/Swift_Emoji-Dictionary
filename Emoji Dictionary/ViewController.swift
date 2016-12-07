//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by Mario Zamora on 12/4/16.
//  Copyright © 2016 tinySEED. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var emojis : [Emoji] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        emojis = makeEmojiArray()
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.stringEmoji
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let emoji = emojis[indexPath.row]
        
        performSegue(withIdentifier: "moveSegue", sender: emoji)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! Emoji
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        emoji3.definition = "Hey Sean"
        emoji3.category = "Category: Person"
        emoji3.createdYear = 1987
        
        let emoji4 = Emoji()
        emoji4.stringEmoji = "🐷"
        emoji4.definition = "Happy Birthday!"
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

