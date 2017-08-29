//
//  CameraViewController.swift
//  Test
//
//  Created by Adam B French on 8/16/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit
import AVFoundation



class CameraViewController: UIViewController {
    
    var session: AVCaptureSession!
    var frontCamera: AVCaptureDevice!
    var backCamera: AVCaptureDevice!
    var currentDevice: AVCaptureDevice!
    var captureDeviceInputBack:AVCaptureDeviceInput!
    var captureDeviceInputFront:AVCaptureDeviceInput!
    var usingFrontCamera = false
    var capturedImage: UIImage!
    var flashOn = false
    var photoOutput: AVCapturePhotoOutput!
    var captureSettings: AVCapturePhotoSettings!
    var photoCaptured:  UIImage!
    var loggedIn = true
    var imageHandler: ImageHandler!
    
    //MARK: - IBOutlets
    @IBOutlet var loginView: LoginView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var flipCameraButton: UIButton!
    @IBOutlet weak var flashButton: UIButton!
    
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        if loggedIn == false {
            self.view.addSubview(loginView)
            self.setupLoginView()
        } else {
            loginView.removeFromSuperview()
            // setupCamera()
            
        }
        self.imageHandler = ImageHandler()
        
    }
    
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        setupLoginView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPreview" {
            if let destination = segue.destination as? PreviewViewController {
                destination.capturedImage = self.imageHandler.snapShot
                print("Prepared for segue")
            } else {
                print("Destination incorrect")
            }
        }
    }
    
    
    
    func setupLoginView() {
        loginView.frame.size = self.view.frame.size
        loginView.bounds.size = self.view.bounds.size
    }
    
    
    
    
    //MARK: - IBActions
    
    
    
    @IBAction func takePicture(_ sender: Any) {
        
        // The simulator cannot take pictures, so i will call Imagehandler method to simply grab the first image available in the imageHandle's array of images
        imageHandler.getImageForPicture {
            self.performSegue(withIdentifier: "ToPreview", sender: self)
        }
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        
        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Text Field Empty!", message: "Enter text in BOTH text fields", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alertController.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: {
                
            })
        } else {
            self.loginView.removeFromSuperview()
            self.loggedIn = true
        }
    }
    
    @IBAction func toggleFlash(_ sender: Any) {
        
        flashOn = !flashOn
        
        if flashOn {
            flashButton.setImage(UIImage(named: "Flash_on"), for: .normal)
        } else {
            flashButton.setImage(UIImage(named: "Flash_off"), for: .normal)
        }
    }
    
    @IBAction func flipCamera(_ sender: Any) {
        
        usingFrontCamera = !usingFrontCamera
        if usingFrontCamera {
            currentDevice = frontCamera
            flipCameraButton.setImage(UIImage(named: "Camera flip selfie")
                , for: UIControlState.normal)
            if backCamera != nil {
                currentDevice = backCamera
            } else {
                currentDevice = frontCamera
                
            }
            
        }  else {
            flipCameraButton.setImage(UIImage(named: "Camera flip")
                , for: UIControlState.normal)
        }

           }
    
    @IBAction func toMemories(_ sender: Any) {
        if let vc =  storyboard?.instantiateViewController(withIdentifier: "MemoriesVC") {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
}
