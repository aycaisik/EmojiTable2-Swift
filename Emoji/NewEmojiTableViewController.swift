//
//  NewEmojiTableViewController.swift
//  Emoji
//
//  Created by Ayça Işık on 8.01.2023.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    
    //MARK: - UI Elements
        @IBOutlet var symbolTextField: UITextField!
        @IBOutlet var nameTextField: UITextField!
        @IBOutlet var descriptionTextField: UITextField!
        @IBOutlet var usageTextField: UITextField!
    //MARK: - Properties
    
        var emoji :Emoji?
         
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Yalnızca saveUnwind ise çalışmaya devam etmeli.
        guard segue.identifier == "saveUnwind" else {return}
        
        // Kullanıcının girdiği bilgilere erişilir.
                let symbol = symbolTextField.text!
                let name = nameTextField.text!
                let description = descriptionTextField.text!
                 let usage = usageTextField.text!
                
                // Girilen bilgiler kullanılarak bir Emoji nesnesi oluşturulur
                // ve 'emoji' property'sine atanır.
                emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
}
