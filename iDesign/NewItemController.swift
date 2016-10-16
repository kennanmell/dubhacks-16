//
//  NewItemController.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class NewItemController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicked: UIImage?
    var newItemView: NewItemView {
        return self.view as! NewItemView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.view = NewItemView(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        newItemView.cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.cancelClicked)))
        newItemView.createButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.createClicked)))
        newItemView.pickImageButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.openPhotoLibraryButton)))
        newItemView.widthField.delegate = self
        newItemView.heightField.delegate = self
        newItemView.nameTextField.delegate = self
        newItemView.classTextField.delegate = self
        newItemView.advancedNewView.cornerRadius.delegate = self
        newItemView.advancedNewView.textRed.delegate = self
        newItemView.advancedNewView.textBlue.delegate = self
        newItemView.advancedNewView.textGreen.delegate = self
        newItemView.advancedNewView.textAlpha.delegate = self
        newItemView.advancedNewView.textFont.delegate = self
        newItemView.advancedNewView.textText.delegate = self
        newItemView.advancedNewView.textSize.delegate = self
        newItemView.advancedNewView.otherRed.delegate = self
        newItemView.advancedNewView.otherBlue.delegate = self
        newItemView.advancedNewView.otherGreen.delegate = self
        newItemView.advancedNewView.otherAlpha.delegate = self
        newItemView.shareButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.shareTapped)))
        newItemView.advancedButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.advancedTapped)))
        newItemView.advancedNewView.doneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.advancedDoneTapped)))
    }
    
    func advancedTapped() {
        newItemView.advancedNewView.isHidden = false
    }
    
    func advancedDoneTapped() {
        newItemView.advancedNewView.isHidden = true
    }
    
    func shareTapped() {
        // Set up and open Apple's default sharing feature.
        
        let objectsToShare: Array<NSObject> = [canvasController!.elementContainer.generateSwiftCode() as NSObject]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        let popoverView = UIView()
        if activityVC.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
            // TODO: iPad
        }
        
        navigationController!.present(activityVC, animated: true, completion: {
            popoverView.removeFromSuperview()
        })
    }
    
    func cancelClicked() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func createClicked() {
        let newView = UIImageView()
        newView.isUserInteractionEnabled = true
        let newElement = UXElement(name: newItemView.nameTextField.text!, className: newItemView.classTextField.text!, view: newView)
        if newItemView.advancedNewView.textRed.text != "" {
            let t1 = NSMutableString()
            t1.append(newElement.name)
            t1.append(".textColor = UIColor(red: ")
            t1.append(newItemView.advancedNewView.textRed.text!)
            t1.append(" / 255.0, green: ")
            t1.append(newItemView.advancedNewView.textGreen.text!)
            t1.append(" / 255.0, blue: ")
            t1.append(newItemView.advancedNewView.textBlue.text!)
            t1.append(" / 255.0, alpha: ")
            t1.append(newItemView.advancedNewView.textAlpha.text!)
            t1.append(" / 255.0)")
            newElement.addInitializer(value: t1 as String)
        }
        if newItemView.advancedNewView.textFont.text != "" {
            let t1 = NSMutableString()
            t1.append(newElement.name)
            t1.append(".font = UIFont(name: \"")
            t1.append(newItemView.advancedNewView.textFont.text!)
            t1.append(("\", size: "))
            t1.append(newItemView.advancedNewView.textSize.text!)
            t1.append(")")
            newElement.addInitializer(value: t1 as String)
        }
        
        if newItemView.advancedNewView.textText.text != "" {
            let t1 = NSMutableString()
            t1.append(newElement.name)
            t1.append(".text = \"")
            t1.append(newItemView.advancedNewView.textText.text!)
            t1.append("\"")
            newElement.addInitializer(value: t1 as String)
        }
        
        if newItemView.advancedNewView.otherRed.text != "" {
            let t1 = NSMutableString()
            t1.append(newElement.name)
            t1.append(".backgroundColor = UIColor(red: ")
            t1.append(newItemView.advancedNewView.otherRed.text!)
            t1.append(" / 255.0, green: ")
            t1.append(newItemView.advancedNewView.otherGreen.text!)
            t1.append(" / 255.0, blue: ")
            t1.append(newItemView.advancedNewView.otherBlue.text!)
            t1.append(" / 255.0, alpha: ")
            t1.append(newItemView.advancedNewView.otherAlpha.text!)
            t1.append(" / 255.0)")
            newElement.addInitializer(value: t1 as String)
        }
        
        if newItemView.advancedNewView.cornerRadius.text != "" {
            let t1 = NSMutableString()
            t1.append(newElement.name)
            t1.append(".layer.cornerRadius = ")
            t1.append(newItemView.advancedNewView.cornerRadius.text!)
            newElement.addInitializer(value: t1 as String)
        }
        
        canvasController!.elementContainer.add(element: newElement)
        canvasController!.view.addSubview(newView)
        newView.frame = CGRect(x: 10, y: 10, width: canvasController!.view.frame.width * CGFloat(Double(newItemView.widthField.text!)! / 100.0), height: canvasController!.view.frame.height * CGFloat(Double(newItemView.heightField.text!)! / 100.0))
        if imagePicked == nil {
            newView.backgroundColor = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        } else {
            newView.image = imagePicked
            imagePicked = nil
        }
        canvasController!.mapping[newView] = newElement
        canvasController!.view.addSubview(newView)
        canvasController!.addPan(view: newView)
        (canvasController!.view as! CanvasView).defaultLabel.isHidden = true
        newItemView.classTextField.text = nil
        newItemView.heightField.text = nil
        newItemView.widthField.text = nil
        newItemView.nameTextField.text = nil
        newItemView.advancedNewView.textText.text = nil
        newItemView.advancedNewView.textRed.text = nil
        newItemView.advancedNewView.textBlue.text = nil
        newItemView.advancedNewView.textGreen.text = nil
        newItemView.advancedNewView.textAlpha.text = nil
        newItemView.advancedNewView.textFont.text = nil
        newItemView.advancedNewView.textSize.text = nil
        newItemView.advancedNewView.otherRed.text = nil
        newItemView.advancedNewView.otherBlue.text = nil
        newItemView.advancedNewView.otherGreen.text = nil
        newItemView.advancedNewView.otherAlpha.text = nil
        newItemView.advancedNewView.cornerRadius.text = nil
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //imageView.contentMode = .ScaleAspectFit
            imagePicked = pickedImage
        }
        self.dismiss(animated: true, completion: nil);
    }
    
}
