//
//  ViewController.swift
//  CameraPhotoLibraryChallenge
//
//  Created by Hyojeong_Jun on 2022/06/10.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var numImage: Int = 0
    var numImageArray: [UIImageView]?
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
//  var videoURL: URL!
    var flagImageSave = false
    
    @IBOutlet var imgViewOne: UIImageView!
    @IBOutlet var imgViewTwo: UIImageView!
    @IBOutlet var imgViewThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        numImageArray?[0] = imgViewOne!
//        numImageArray?[1] = imgViewTwo!
//        numImageArray?[2] = imgViewThree!
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        numImage += 1
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera")
        }
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        numImage += 1
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        numImage = 0
        imgViewOne.image = nil
        imgViewTwo.image = nil
        imgViewThree.image = nil
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            
            //Text.text = String(numImage)
            if numImage == 1 {
                imgViewOne.image = captureImage
            } else if numImage == 2 {
                imgViewTwo.image = captureImage
            } else if numImage == 3 {
                imgViewThree.image = captureImage
                numImage = 0
            }
            
//            print(numImage)
//            print("이미지뷰: ", numImageArray?[numImage].image)
//            numImageArray?[numImage].image = captureImage
//        } else if mediaType.isEqual(to: "public.movie" as String) {
//            if flagImageSave {
//                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
//
//                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
//            }
         }

        //print("이미지뷰: ", numImageArray?[numImage].image)
        //numImageArray?[numImage].image = captureImage
        //imgViewOne.image = captureImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage -= 1
        self.dismiss(animated: true, completion: nil)
    }
}

