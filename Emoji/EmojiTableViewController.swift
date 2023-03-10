//
//  EmojiTableViewController.swift
//  Emoji
//
//  Created by Ayรงa Iลฤฑk on 8.01.2023.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    
      var emojis: [Emoji] = [
          Emoji(symbol: "๐", name: "Grinning Face",
                description: "A typical smiley face.", usage: "happiness"),
          Emoji(symbol: "๐", name: "Confused Face",
                description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
          Emoji(symbol: "๐", name: "Heart Eyes",
                description: "A smiley face with hearts for eyes.",
                usage: "love of something; attractive"),
          Emoji(symbol: "๐ฎ", name: "Police Officer",
                description: "A police officer wearing a blue cap with a gold badge.",
                usage: "person of authority"),
          Emoji(symbol: "๐ข", name: "Turtle",
                description: "A cute turtle.",
                usage: "Something slow"),
          Emoji(symbol: "๐", name: "Elephant",
                description: "A gray elephant.",
                usage: "good memory"),
          Emoji(symbol: "๐", name: "Spaghetti",
                description: "A plate of spaghetti.",
                usage: "spaghetti"),
          Emoji(symbol: "๐ฒ", name: "Die",
                description: "A single die.",
                usage: "taking a risk, chance; game"),
          Emoji(symbol: "โบ๏ธ", name: "Tent",
                description: "A small tent.",
                usage: "camping"),
          Emoji(symbol: "๐", name: "Stack of Books",
                description: "Three colored books stacked on each other.",
                usage: "homework, studying"),
          Emoji(symbol: "๐", name: "Broken Heart",
                description: "A red, broken heart.",
                usage: "extreme sadness"),
          Emoji(symbol: "๐ค", name: "Snore",
                description: "Three blue \'z\'s.",
                usage: "tired, sleepiness"),
          Emoji(symbol: "๐", name: "Checkered Flag",
                description: "A black-and-white checkered flag.",
                usage: "completion") ,
          Emoji(symbol: "๐", name: "Wฤฑz Wฤฑz Bee",
                description: "A cute bee.",
                usage: "send valentine")
      ]
      
      // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditEmoji"{
            //O an seรงili olan hรผcrenin indexine ulaลtฤฑk.
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            //O an seรงili olan index ile emojis arrayinden gerekli olan objeye ulaลฤฑlฤฑr.
            let selectedEmoji  = emojis[selectedIndexPath.row]
            
            //Seguenin storyboardda baฤlฤฑ olduฤu yer bir navigation controllerdฤฑr... destination gรถsterdiฤi yer gibi hedef..
            let navigationController = segue.destination as! UINavigationController
            
            //NavigationControllerฤฑn RootviewController(kendisinin baฤlฤฑ oldugu ilk sayfa) ulaลฤฑlฤฑr.
            let editEmojiController = navigationController.topViewController as! NewEmojiTableViewController
            
            //Gidilecek sayfada bulunan emoji doldurulur.
            editEmojiController.emoji = selectedEmoji
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // 1 section varsa bu fonksiyonu yazmak zorunda deฤilsiniz.
        // รรผnkรผ: Varsayฤฑlan section sayฤฑsฤฑ zaten 1'dir.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // Her section iรงin 1 kez รงalฤฑลฤฑyor. รrneฤin, 4 section'a sahip bir tableView varsa,
        // Bu fonksiyon her section iรงin 1kez olmak รผzere toplam 4 kez รงalฤฑลacaktฤฑr.
        // Section parametresi o an รงizilmekte olan section bilgisini verir.
        return emojis.count //Elimizdeki emoji sayฤฑsฤฑ kadar hรผcre olmasฤฑ..
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Bir hรผcre, ne zamanki ekrana gelecek; cellForRow ile รงizilir.
        // Bu fonksiyonun kaรง kez รงalฤฑลacaฤฤฑ belli deฤildir.
            // รrnek 1: Kullanฤฑcฤฑ hiรง scrool etmez ise, ekranda gรถrรผnebilir olan hรผcre sayฤฑsฤฑ kadar รงalฤฑลฤฑr.
            // รrnek 2: Kullanฤฑcฤฑ scroll etmeye baลlarsa scroll ettiฤi sรผrece bu fonksiyon รงalฤฑลฤฑr.
             
        //IndexPath: O an รงizilmekte olan hรผcrenin konum bilgisi
        //Adฤฑm 1 : O an รงizilmekte olan emoji nesnesine indexPath deฤeri ile ulaลmak
        let emoji = emojis[indexPath.row]
        
        //Adฤฑm 2 : Hรผcre oluลturmak.
        //ReuseIdentifier: Storyboard'da hรผcre iรงin verdiฤiniz identifier deฤeri.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")! as! EmojiTableViewCell
        //as! ekledik. yeni app iรงin.
        
        //Adฤฑm 3: Hรผcreyi data ile doldurmak.
        cell.update(with: emoji)
        //cell.textLabel?.text = "\(emoji.symbol)- \(emoji.name)" //Title
        //cell.detailTextLabel?.text = "\(emoji.description)" //Subtitle
        
        return cell
        
    }
    
    //MARK: - Table View Delegete
    //Zorunlu deฤil bu fonksiyonlarฤฑ yazmak.
    //Hรผcreye tฤฑklandฤฑ bilgisi.
    //didselectrow yazsan yetiyor.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Bu fonksiyon, kullanฤฑcฤฑ hรผcrenizi seรงtiฤi zaman(รผstรผne tฤฑkladฤฑฤฤฑ zaman)รงalฤฑลฤฑr.
        //indexPath'in row propertysini kullanarak รผstรผne tฤฑklanฤฑlan emojiye ulaลฤฑlฤฑr.
        let selectedEmoji = emojis[indexPath.row]
        //Storyboardda toeditemoji adฤฑna sahip olan segue รงalฤฑลtฤฑrฤฑlฤฑr.
        performSegue(withIdentifier: "toEditEmoji", sender: nil)
        print("\(selectedEmoji.symbol)\(indexPath)")
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // Bu fonksiyon, TableView editing modundayken her hรผcrenin
                // hangi tรผr editingStyle'a sahip olacaฤฤฑnฤฑ belirtir.
                return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // indexPath: Editing aksiyonun gerรงekleลtiฤi hรผcrenin konumu.
            // editingStyle: Gerรงekleลen aksiyon. (.delete veya .insert)
            
            if editingStyle == .delete {
                // Adฤฑm 1: 'emojis' array'ฤฐnden indexPath.row'da bulunan objeyi sil.
                emojis.remove(at: indexPath.row)
                
                // Adฤฑm 2: TableView'a hรผcrenin silinmesi gerektiฤi bilgisi verilir...
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    //MARK: - Actions
    
    //move row at yazdฤฑk รงฤฑktฤฑ.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //sourceIndexPath: sฤฑrasฤฑ deฤiลtirilmek istenen hรผcrenin konumu.
        //destinationIndexPath: gidilmesi istenen konum.(Parmak ekran kaldฤฑrฤฑlฤฑnca)
        
        //COK ONEMLI: "emojis" arrayin tableview hรผcre sฤฑrasฤฑyla aynฤฑ kalmasฤฑ gerekir.
        //Bu senkronu saฤlayabilmek iรงin hareket ettirilen objenin, arrayde de konumu deฤiลtirilir.
        //Adฤฑm 1: Hareket ettirilen emoji nesnesine ulaลmak ve arrayden silmek.
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        //Adฤฑm 2: Silinen elemanฤฑ arrayde yeni yerine ekleriz.
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        //Adฤฑm 3: TableView gรผncellenen array sฤฑrasฤฑ ile tรผm elemanlarฤฑnฤฑ yeniden รงizicek.
        tableView.reloadData() 
        
    }
    
    @IBAction func editButtonTapped(_ button:UIBarButtonItem){
        
        //isEditing o an TableViewin edit modda olup olmadฤฑฤฤฑ bilgisini verir.
        let tableViewEditing = tableView.isEditing
        //TableViewin editing moda girmesini ve รงฤฑkmasฤฑnฤฑ saฤlar.
        tableView.setEditing(!tableViewEditing, animated: true)
    }

    @IBAction func unwindFromNewEmoji(_ segue:UIStoryboardSegue){
        //Bu fonksiyon, newemojitableviewcontroller tarafฤฑndan รงalฤฑลtฤฑrฤฑlacak.
        //Bu sefer save tuลuna basฤฑp exit kฤฑsmฤฑna getirirsek bu gรถzรผkecektir.(Storyboardda).
        
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? NewEmojiTableViewController,
              let newEmoji = sourceViewController.emoji else {return}
        //
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            //Daha รถnceden bir hรผcre seรงilmiล.
            //Emojinin ve tableview hรผcresinin gรผncellenmesi gerekiyor.
            //Adฤฑm 1: emojis arrayinde seรงili bulunan hรผcrenin indexinde bulunan nesnenin gรผncellenmesi.
            emojis[selectedIndexPath.row] = newEmoji
            
            //Adฤฑm 2: yalnฤฑzca seรงili olan hรผcrenin yeniden รงizilmesini saฤlamak.
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }else{
            //Seรงili bir hรผcre bulunmuyor
            //Yeni emoji eklenmeli
            
            //Adฤฑm 1: Yeni bir hรผcre iรงin indexPath oluลtur
            let newindexPath = IndexPath(row: emojis.count, section: 0)
            
            //Adฤฑm 2: Yeni emoji objesini "emoji" arrayine ekle.
            emojis.append(newEmoji)
            
           
            
            //Adฤฑm 3: Oluลturulan IndexPath ile tableViewa yeni bir hรผcre eklenir.
            tableView.insertRows(at: [newindexPath], with: .automatic)}
       
    }

}
