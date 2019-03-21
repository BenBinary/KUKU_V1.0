//
//  PVC_AuftragNeu_ZSM_2.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 21.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


import UIKit

class PVC_AuftragNeu_ZSM_2: UIPageViewController {
    
    var auftrag = Auftrag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newZusammenfassungViewController(nummer: 1), self.newZusammenfassungViewController(nummer: 2)]
    }()
    
    
    private func newZusammenfassungViewController(nummer: Int) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_AuftragNeu_ZSM_2_\(nummer)")
        
        
    }
    
}

extension PVC_AuftragNeu_ZSM_2 : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.lastIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return orderedViewControllers.last }
        
        guard orderedViewControllers.count > previousIndex else { return nil }
        
        return orderedViewControllers[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.lastIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllersCount = orderedViewControllers.count
        
        
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        
        return orderedViewControllers[nextIndex]
        
    }
    
    
    // Anzahl der Punkte
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    
    // Aktueller Punkt
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.firstIndex(of: firstViewController) else { return 0 }
        
        return firstViewControllerIndex
    }
    
    
    
    
}
