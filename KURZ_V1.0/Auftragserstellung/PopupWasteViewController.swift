//
//  PopupWasteViewController.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class PopupWasteViewController: PopupViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    var stoffe:[stoffAuswahl] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Füllen des Arrays mit den entsprechneden Ansichten
        stoffe = createStoffe()
        
        setupStoffScrollView(stoff: stoffe)
        
        
        pagecontrol.numberOfPages = stoffe.count
        pagecontrol.currentPage = 0
        view.bringSubviewToFront(pagecontrol)
        

        
        scrollview.delegate = self
    
    }
    
    func setupStoffScrollView(stoff: [stoffAuswahl]) {
        
        scrollview.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollview.contentSize = CGSize(width: view.frame.width * CGFloat(stoff.count), height: view.frame.height)
        scrollview.isPagingEnabled = true
        
        
        for i in 0 ..< stoff.count {
            
            stoff[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollview.addSubview(stoff[i])
            
        }
        
    }

    
    func createStoffe() -> [stoffAuswahl] {
        
        let stoff1:stoffAuswahl = Bundle.main.loadNibNamed("stoffAuswahl", owner: self, options: nil)?.first as! stoffAuswahl
        
        stoff1.btnImg1.imageView?.image = UIImage(named: "stoff_bau_und_abbruchabfaelle")
        stoff1.btnImg1.setImage(UIImage(named: "stoff_bau_und_abbruchabfaelle"), for: .normal)
        stoff1.btnImg1.setTitle("Bau und Abbruchabfälle", for: .normal)
        
        stoff1.btnImg2.setImage(UIImage(named: "stoff_bma"), for: .normal)
        stoff1.btnImg3.setImage(UIImage(named: "stoff_erdaushub"), for: .normal)
        stoff1.btnImg4.setImage(UIImage(named: "stoff_gemischte_abfaelle"), for: .normal)
        
        let stoff2:stoffAuswahl = Bundle.main.loadNibNamed("stoffAuswahl", owner: self, options: nil)?.first as! stoffAuswahl
        stoff2.btnImg1.setImage(UIImage(named: "stoff_gips"), for: .normal)
        stoff2.btnImg2.setImage(UIImage(named: "stoff_gruengut"), for: .normal)
        stoff2.btnImg3.setImage(UIImage(named: "stoff_holz_a1a3"), for: .normal)
        stoff2.btnImg4.setImage(UIImage(named: "stoff_holz_a4"), for: .normal)
        
        let stoff3:stoffAuswahl = Bundle.main.loadNibNamed("stoffAuswahl", owner: self, options: nil)?.first as! stoffAuswahl
        stoff3.btnImg1.setImage(UIImage(named: "stoff_papier"), for: .normal)
        stoff3.btnImg2.setImage(UIImage(named: "stoff_sperrmuell"), for: .normal)
        
        
        return [stoff1, stoff2, stoff3]
        
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pagecontrol.currentPage = Int(pageIndex)
        
        
        let maximmumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertikal
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximmumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Rückgabe des ausgwählten Stoffes
        
        if (segue.destination is VC_AuftragNeu_01_ContStoff) {
            
            let vc = segue.destination as? VC_AuftragNeu_01_ContStoff
            
            //vc?.auftrag.stoff = stoffe.
            
            
            
            
        }
        
        
    }
    

}
