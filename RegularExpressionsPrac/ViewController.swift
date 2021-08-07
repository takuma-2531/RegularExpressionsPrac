//
//  ViewController.swift
//  RegularExpressionsPrac
//
//  Created by 小川卓馬 on 2021/08/07.
//

import UIKit

extension String {
    func regexMatch(pattern: String) -> Int {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return 0
        }
        let result = regex.matches(in: self, options: [], range: NSRange(0..<self.count))
        return result.count
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var targetStringTextView: UITextView!
    @IBOutlet weak var regularExpressionsTextFiled: UITextField!
    @IBOutlet weak var answerLabel: UILabel!

    @IBAction func TapCheckButton(_ sender: UIButton) {
        let matchCounts = targetStringTextView.text!.regexMatch(pattern: regularExpressionsTextFiled.text!)
        let answerLabelText: String
        if matchCounts <= 0 {
            answerLabelText = "対象なし"
        } else {
            answerLabelText = "\(matchCounts)つ当てはまる"
        }
        answerLabel.text = answerLabelText
    }

}

