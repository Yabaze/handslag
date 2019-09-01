//
//  CameraCaptureViewController.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents
import AVFoundation

class CameraCaptureViewController: UIViewController  ,UINavigationControllerDelegate , UIImagePickerControllerDelegate,
AVCapturePhotoCaptureDelegate{
    
    @IBOutlet weak var captureButton: MDCFloatingButton!
    
    private let session = AVCaptureSession()
    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        captureButton.backgroundColor = UIColor.white
        captureButton.setTitle("+", for: .normal)
        captureButton.addTarget(self, action: #selector(captureImage), for: .touchUpInside)
       
        previewView.session = session
        
        setUpUI()
    
    }
    
    @IBAction func segmentSelected(_ sender: Any) {
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

    }
    
    @objc func captureImage() {
        
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        
        photoOutput.capturePhoto(with: settings, delegate: self)
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            frontImage.image = image
            segmentControl.selectedSegmentIndex = 1
        case 1:
            backImage.image = image
            segmentControl.selectedSegmentIndex = 2
        default:
            logoImage.image = image
        }
        
    }
    
    func setUpUI() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // The user has previously granted access to the camera.
            settingUpCaptureSession()
            break
            
        case .notDetermined:
            /*
             The user has not yet been presented with the option to grant
             video access. Suspend the session queue to delay session
             setup until the access request has completed.
             
             Note that audio access will be implicitly requested when we
             create an AVCaptureDeviceInput for audio during session setup.
             */
            //sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                if !granted {
                    //self.setupResult = .notAuthorized
                }
                //self.sessionQueue.resume()
            })
            
        //default:
            // The user has previously denied access.
            //setupResult = .notAuthorized
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        @unknown default:
            print("default")

        }
    }
    
    let photoOutput = AVCapturePhotoOutput()

    func settingUpCaptureSession() {
        
        session.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                  for: .video, position: .unspecified)
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            session.canAddInput(videoDeviceInput)
            else { return }
        session.addInput(videoDeviceInput)
        
        
        guard session.canAddOutput(photoOutput) else { return }
        session.sessionPreset = .photo
        session.addOutput(photoOutput)
        session.commitConfiguration()
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
        self.previewView.videoPreviewLayer.session = self.session

    }

    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.session.stopRunning()
    }

}
