//
//  NameInputViewController.swift
//  GithubPublicRepos
//
//  Created by Mohamed Elsayeh on 8/21/18.
//  Copyright © 2018 Mohamed Elsayeh. All rights reserved.
//

import UIKit

class NameInputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        submitButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.nameTextField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSeque" {
            (segue.destination as! ViewController).username = nameTextField.text ?? ""
        }
    }
}
