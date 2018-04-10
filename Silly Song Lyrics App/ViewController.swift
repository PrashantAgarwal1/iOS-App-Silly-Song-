//
//  ViewController.swift
//  Silly Song Lyrics App
//
//  Created by Prashant Agarwal on 4/9/18.
//  Copyright © 2018 com.Simplicity. All rights reserved.
//

import UIKit

func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased()
    var notVowel = lowercaseName
    let test1 = notVowel.removeFirst()
    
    if(test1 == "a" || test1 ==  "e" || test1 == "i" || test1 == "o" || test1 == "u") {
        return lowercaseName
    }
    else {
        let test = lowercaseName.substring(from: lowercaseName.index(after: lowercaseName.startIndex))
        return test
    }
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

var song = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Prashan")
//print(song)


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lyricsField: UITextView!
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsField.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsField.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }

}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

