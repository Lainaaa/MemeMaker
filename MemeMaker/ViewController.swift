//
//  ViewController.swift
//  MemeMaker
//
//  Created by Dmitrij Meidus on 20.05.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///Allow label be changed (for dragTopLabel and dragBottomLabel)
        bottomCaptionLabel.isUserInteractionEnabled = true
        topCaptionLabel.isUserInteractionEnabled = true
        
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        let topChoices = [🍺,🧨,🍩]
        let bottomChoices = [🐱,🐶,🐵]
        insertSegments(choices: topChoices, control: topSegmentedControl)
        insertSegments(choices: bottomChoices, control: bottomSegmentedControl)
    }
    
    func insertSegments(choices: [CaptionOption], control: UISegmentedControl){
            for choice in choices {
                control.insertSegment(withTitle: choice.emoji, at: choices.count, animated: false)
            }
        }
    
    let 🍺 = CaptionOption(emoji: "🍺", caption: "You know what's cool?")
    let 🧨 = CaptionOption(emoji: "🧨", caption: "You know what makes me mad?")
    let 🍩 = CaptionOption(emoji: "🍩", caption: "You know what I love?")
    
    let 🐱 = CaptionOption(emoji: "🐱", caption: "Cats wearing hats")
    let 🐶 = CaptionOption(emoji: "🐶", caption: "Dogs carrying logs")
    let 🐵 = CaptionOption(emoji: "🐵", caption: "Monkeys being funky")

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex){
                case "🍺":
                    topCaptionLabel.text = 🍺.caption
                case "🧨":
                    topCaptionLabel.text = 🧨.caption
                case "🍩":
                    topCaptionLabel.text = 🍩.caption
                case "🐱":
                    bottomCaptionLabel.text = 🐱.caption
                case "🐶":
                    bottomCaptionLabel.text = 🐶.caption
                case "🐵":
                    bottomCaptionLabel.text = 🐵.caption
                default:
                    fatalError()
        }
}
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
                topCaptionLabel.center =
                   sender.location(in: view)
            }
    }
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
                bottomCaptionLabel.center =
                   sender.location(in: view)
            }
    }
}

