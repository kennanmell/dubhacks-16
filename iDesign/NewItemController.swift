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
        newItemView.shareButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NewItemController.shareTapped)))
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
