//
//  EqView.swift
//  EasyCity
//
//  Created by tolgahan sonmez on 22.03.2023.
//

import UIKit

class EqView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tv: UITableView!
    
    var sehir1 = ""
    var sehirTv = [String]()
    var tarihTv = [String]()
    var saatTv = [String]()
    var siddetTv = [String]()
    var derinlikTv = [String]()
    var latTv = [String]()
    var lngTv = [String]()
    
    var array = [String]()
    var contents = String()
    var dictArray = [String]()
    var keyArray = ["tarih", "saat", "enlem", "boylam", "derinlik", "bos1", "siddet", "bos2", "gereksiz", "sehir", "durum"]
    var fullStack = [String : String]()
    var allData = [[String : String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirTv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EqTableCell
        cell.sehir.text = sehirTv[indexPath.row]
        cell.saat.text = saatTv[indexPath.row]
        cell.tarih.text = tarihTv[indexPath.row]
        cell.siddet.text = siddetTv[indexPath.row]
        return cell
        
    }
    
}

