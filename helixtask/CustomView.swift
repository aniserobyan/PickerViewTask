//
//  CustomView.swift
//  helixtask
//
//  Created by Ani on 7/3/17.
//  Copyright © 2017 Ani. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate  {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func clickTapped(_ sender: UIButton) {
        var characters = Array((self.inputField.text ?? "").characters).map({ String(describing: $0) })
        
        while characters.count < 5 {
            characters.insert("0", at: 0)
        }
        for i in stride(from: 4, through: 0, by: -1) {
            self.pickerView.selectRow(Int(characters[i])!, inComponent: i, animated: true)
        }
        
        self.inputField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBInspectable var inputNumber:Int {
        get {
            return Int(self.inputField.text ?? "0")!
        }
        set {
            self.inputField.text = String(describing: newValue)
        }
    }
    
    @IBInspectable var textcolor:UIColor? {
        get {
            return self.inputField.textColor!
        }
        
        set {
            self.inputField.textColor = newValue
        }
    }
    
    @IBInspectable var inputBgColor: UIColor? {
        get {
            return self.inputField.backgroundColor!
        }
        
        set {
            self.inputField.backgroundColor = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let nib = UINib(nibName: "CustomView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        view.frame = self.bounds
        view.autoresizingMask = [
            .flexibleHeight, .flexibleWidth
        ]
        
        self.addSubview(view)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: row)
    }

}
