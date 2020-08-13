//
//  ViewController.swift
//  CombineWithUIKit
//
//  Created by ramil on 13.08.2020.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purcheseButton: UIButton!
    
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cancellable = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: priceTextField)
            .map { $0.object as? UITextField}
            .compactMap { $0?.text }
            .map { str -> Bool in
                if let number = Double(str) {
                    return number > 10
                } else {
                    return false
                }
            }
            .assign(to: \.isEnabled, on: purcheseButton)
    }


}

