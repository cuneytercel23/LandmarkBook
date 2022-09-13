//
//  ViewController.swift
//  Landmark Book
//
//  Created by Cüneyt Erçel on 29.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    /*  EZBER !!! Şimdi önce yukarıya  UITableViewDelegate, UITableViewDataSource bunları ekledik, Daha sonra kırmızı uyarı cıktı çünkü bu işlemi yaparken 2 tane fonksiyon belirtmek gerekiyor, o yüzden aşağıda tableView yazınca otomatik olarak cellforrowat ve numbersofrowsinsection ikisini de ayrı ayrı açtım, en sonda override altındaki tableviewları delegate ve datasource kısmını yaptım bunlar hep yapılan şeyler imiş ona göre misali*/
    @IBOutlet weak var tableView: UITableView!
    
    // burda resim ve isimlerini tanımlıyaacam arrayle falanz.
        
    var landmarkNames = [String]()
    
    // buda resimin arrayi ve resimleri koda ekleme burda maine gitmedik neden bilmiyorummm
    
    var landmarkImages = [UIImage]()
    
    // İKİNCİ SAYFAYA DEĞER TAŞIMA MEVZUSU SON MEVZU 1
    var chosenlandmarkName = ""
    var chosenlandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    //DATALAR burda resim ve isimlerini tanımlıyaacam arrayle falanz.
        landmarkNames.append("Elazığ")
        landmarkNames.append("İstanbul")
        landmarkNames.append("Tokat")
        landmarkNames.append("Sivas")
        
        // DATALAR buda resimin arrayi ve resimleri koda ekleme burda maine gitmedik neden bilmiyorummm
        
        landmarkImages.append(UIImage(named: "elazig.jpeg")!)
        landmarkImages.append(UIImage(named: "istanbul.jpeg")!)
        landmarkImages.append(UIImage(named: "tokat.jpeg")!)
        landmarkImages.append(UIImage(named: "sivas.jpeg")!)
        
        
        
        
        
        
        
        tableView.delegate = self // self en baştaki ViewController demek
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row] // **** ÖNEMLİ **** indexPath.row döngü bazında çalışır bu kodu yazarak landmarknameslerdeki arrayi aynı şekil geçirmiş olduk.
        // textLabel.text yazarak text yeri açtım sanırsam.
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count // satır sayısı fonksiyonu
    }
    
    
    // SOLA KAYDIRINCA SİLME, burda tableViewı yazıp devamına commitfor yazınca direkt bu geliyor ve buna basıyoruz.
    // if kısmında editingstyle kendi kurduğumuz bişi değil zaten var
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {   // eğer kullanıcı silmek isterse
            
            landmarkNames.remove(at: indexPath.row) // İndex path burayada yetişti
            landmarkImages.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        
    }
    }
    
    //DİD SELECT İLE İKİNCİ SAYFAYA GEÇİŞ- didselect yazdım direkt geldi karşıma ona bastım. identiferı zaten main kısmında verdim, performsegue yazınca alttakiler cıktı bende identiferı doldurdum sendera nil dedik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        /* İKİNCİ SAYFAYA DEĞER TAŞIMA MEVZUSU SON MEVZU 2
         burada basıldığında rowlara, indexpath.rowdan alıp soldaki yazdığım isime hangisi olduğnu ata, örneğin istanbula bastı. ist ismini ve ist resmini seçip chosenlnadmarkname ve chosenlandmarkimagese atıyor */
        chosenlandmarkName = landmarkNames[indexPath.row]
        chosenlandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
            
    }

    /*İKİNCİ SAYFAYA DEĞER TAŞIMA MEVZUSU SON MEVZU 3
     prepare yazıp ilk gelene tıklıyorum sonra eğer içerdeki segue identifearımı eşitse diyorum */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
            let destinationVC = segue.destination as!  secondViewController// burda segueçdestinationu secondviewcontroller olarak soldaki şeye tanımla. VE BUNU DEDİĞİM İÇİN ŞİMDİ İKİNCİ VC DEKİ TANIMLADIĞIM ŞEYLERİ KULLANABİLİYORUUUMM.
            
            
            // destinationVC Nokta diyerek 2. sayfadaki selectedlandmarknames ve imagese ulaştım onları da burada indexpathrowa atadığım chosenlandmarklara eşitledim olay bitii
            
             destinationVC.selectedlandmarkImages = chosenlandmarkImage
            destinationVC.selectedlandmarkNames = chosenlandmarkName
            
        }
            
    }
}


