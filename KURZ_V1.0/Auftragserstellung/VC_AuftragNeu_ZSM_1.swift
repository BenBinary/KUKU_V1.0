//
//  VC_AuftragNeu_ZSM_1.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 13.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import MapKit

class VC_AuftragNeu_ZSM_1: UIViewController {

    var auftrag = Auftrag()
    
    @IBOutlet weak var imgStoff: UIImageView!
    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var lblAnlieferung: UILabel!
    @IBOutlet weak var lblAuftragstext: UILabel!
    @IBOutlet weak var lblAbholung: UILabel!
    @IBOutlet weak var mpStandort: MKMapView!
    @IBOutlet weak var lblStrasseHsNr: UILabel!
    @IBOutlet weak var lblAdresszusatz: UILabel!
    @IBOutlet weak var lblPLZStadt: UILabel!
    @IBOutlet weak var btnBestaetigen: UIButton!
    let dateFormatter = DateFormatter()
    lazy var documentdir = VC_AuftragNeu_ZSM_1.docURL(for: "auftrag.json")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Setzen der Datums-Felder
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .none
        dateFormatter.locale = Locale(identifier: "de_DE")
        
        // Verbergen der Datumsfelder je nach Auftragstyp
        /*
        if (auftrag.typ == Auftragstyp.Anlieferung ) {
            lblAbholung.isHidden = true
        } else if (auftrag.typ == Auftragstyp.AnlieferungAbholung) {
            lblAbholung.text = dateFormatter.string(from: auftrag.pickupDate)
        }
        */
        
        // Einlesen / dekodieren der lokalen JSON-Datei
        let decoder = JSONDecoder.init()
      
       // let auftrag_file = documentdir.appendingPathComponent("auftrag.json")
        do {
            let auftrag_file_content = VC_AuftragNeu_ZSM_1.readArray()
           let auftrag_file = VC_AuftragNeu_ZSM_1.readArray().first
            
            lblAnlieferung.text = auftrag_file_content.first?.deliverDate.description
            lblAbholung.text = auftrag_file_content.first?.pickupDate.description
             print(auftrag_file_content)
            
            print(auftrag_file)
            
            lblStrasseHsNr.text = auftrag_file?.strasse.description
            lblAdresszusatz.text = "\(auftrag_file?.adresszusatz)"
            lblPLZStadt.text = "\(auftrag_file?.plz) \(auftrag_file?.stadt)"
            
        } catch {
            print(error)
        }
   
        
        
    }
  
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    static func readArray() -> [Auftrag] {
        
        let dec = JSONDecoder()
        
       // let documentdir = getDocumentsDirectory()
         let auftrag_file = docURL(for: "auftrag.json")
            do {
                let jsondata = try Data(contentsOf: auftrag_file!)
                
                return try dec.decode([Auftrag].self, from: jsondata)
            }
            catch {
                print(error)
            }
        
             return [Auftrag]()
        }
    



func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
    
    private static func docURL(for filename: String) -> URL? {
        
        //sollte immer genau ein Ergebnis liefern
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let docDir = urls.first {
            return docDir.appendingPathComponent(filename)
        }
        return nil
    }

}
