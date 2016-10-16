//
//  CanvasController.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

var canvasController: CanvasController?

class CanvasController: UIViewController {
    
    var elementContainer: ElementContainer!
    var newItemController: NewItemController!
    var mapping = Dictionary<UIView, UXElement>()

    var canvasView: CanvasView {
        return self.view as! CanvasView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        canvasController = self
        newItemController = NewItemController(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        elementContainer = ElementContainer(className: "MyView")
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(CanvasController.doubleTapped))
        doubleTapRecognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTapRecognizer)
    }
    
    func addPan(view: UIView) {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.panDragView)))
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CanvasController.deleteTapped)))
    }
    
    func panDragView(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    func deleteTapped(sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Delete Element?", message:
            "This action cannot be undone.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            sender.view?.removeFromSuperview()
            self.elementContainer.remove(element: self.mapping[sender.view!]!)
            self.mapping.removeValue(forKey: sender.view as! UIImageView)
        }))
        
        navigationController!.present(alertController, animated: true, completion: nil)
    }
        
    func doubleTapped() {
        self.navigationController?.pushViewController(newItemController, animated: true)
    }
    
    // MARK: UINavigationControllerDelegate
    /*
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController.isKind(of: NewItemController.self) {
            let newElement = UXElement(name: currentName, className: currentClass, view: currentView!)
            elementContainer.add(element: newElement)
            self.view.addSubview(currentView!)
            currentView!.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            currentView!.backgroundColor = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
            currentView!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.panDragView)))
        }
    }
*/
}

