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
        
        let topChoices = [๐บ,๐งจ,๐ฉ]
        let bottomChoices = [๐ฑ,๐ถ,๐ต]
        insertSegments(choices: topChoices, control: topSegmentedControl)
        insertSegments(choices: bottomChoices, control: bottomSegmentedControl)
    }
    
    func insertSegments(choices: [CaptionOption], control: UISegmentedControl){
            for choice in choices {
                control.insertSegment(withTitle: choice.emoji, at: choices.count, animated: false)
            }
        }
    
    let ๐บ = CaptionOption(emoji: "๐บ", caption: "You know what's cool?")
    let ๐งจ = CaptionOption(emoji: "๐งจ", caption: "You know what makes me mad?")
    let ๐ฉ = CaptionOption(emoji: "๐ฉ", caption: "You know what I love?")
    
    let ๐ฑ = CaptionOption(emoji: "๐ฑ", caption: "Cats wearing hats")
    let ๐ถ = CaptionOption(emoji: "๐ถ", caption: "Dogs carrying logs")
    let ๐ต = CaptionOption(emoji: "๐ต", caption: "Monkeys being funky")

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex){
                case "๐บ":
                    topCaptionLabel.text = ๐บ.caption
                case "๐งจ":
                    topCaptionLabel.text = ๐งจ.caption
                case "๐ฉ":
                    topCaptionLabel.text = ๐ฉ.caption
                case "๐ฑ":
                    bottomCaptionLabel.text = ๐ฑ.caption
                case "๐ถ":
                    bottomCaptionLabel.text = ๐ถ.caption
                case "๐ต":
                    bottomCaptionLabel.text = ๐ต.caption
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

