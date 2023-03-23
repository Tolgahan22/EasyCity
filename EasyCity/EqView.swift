//
//  EqView.swift
//  EasyCity
//
//  Created by tolgahan sonmez on 22.03.2023.
//

import UIKit

class EqView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tv: UITableView!
    var sehirTv = [String]()
    var tarihTv = [String]()
    var saatTv = [String]()
    var siddetTv = [Double]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
        DispatchQueue.main.async {
            self.getEqData()
        }
        
        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirTv.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EqTableCell
        cell.sehir.text = self.sehirTv[indexPath.row]
        cell.tarih.text = self.tarihTv[indexPath.row]
        cell.siddet.text = "\(self.siddetTv[indexPath.row])"
        
        
        return cell
        
    }
    func getEqData(){
        let url = URL(string: "https://api.orhanaydogdu.com.tr/deprem/kandilli/live")
    
            let session = URLSession.shared
            let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error!)
                } else {
                    if data != nil {
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]

                            DispatchQueue.main.async {
                                //print(jsonResponse?["result"]
                                if let data = jsonResponse!["result"] as? [Any]{
                                    // print(data)
                                    for i in Range(0...20){
                                        if let yer = data[i] as? [String:Any]{

                                            if let title = yer["title"] as? String{
                                                self.sehirTv.append(title)
                                                
                                
                                            }
                                            if let date = yer["date"] as? String{
                                                self.tarihTv.append(date)
                                            }
                                            if let mag = yer["mag"] as? Double{
                                                self.siddetTv.append(mag)
                                  }
                                  
                                  }
                              
                          }

                     }
                      
                      self.tv.reloadData()
                  }
              } catch {

              }
          }
      }
  }
  task.resume()
}
    
}
