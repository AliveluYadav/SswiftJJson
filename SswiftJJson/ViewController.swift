//
//  ViewController.swift
//  SswiftJJson
//
//  Created by LetMeCall Corp on 11/12/18.
//  Copyright © 2018 LetMeCall Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var  urlString = "http://www.groupkt.com/post/c9b0ccb9/country-and-other-related-rest-webservices.htm"
    var profileImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var params = [String:AnyObject]()
        params["content"] = "something" as AnyObject?
        params["location_id"] = "201" as AnyObject?
        
        // Grab your image from some variable or imageView. Here self.profileImage is a UIImage object
        if let profileImageData:UIImage = self.profileImage {
            if let imageData = profileImageData.jpegData(compressionQuality: 0.5)
                {
                params["imageName"] = imageData as AnyObject?
                APIManagr.apiMultipart(serviceName: "http://yourAPIURL", parameters: params, completionHandler: { (response:JSON?, error:NSError?) in
                    //Handle response
                })
            } else {
                print("Image problem")
            }
        }
        
//
//        let image = UIImage.init(named: "myImage")
//        let imgData = image?.jpegData(compressionQuality: 0.2)
//
//
////        let parameters = ["name": rname] //Optional for extra parameter
//
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(imgData!, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in Parameters {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            } //Optional for extra parameters
//        },
//                         to:"mysite/upload.php")
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response.result.value)
//                }
//
//            case .failure(let encodingError):
//                print(encodingError)
//            }
//        }
//
    }
    
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue"
        {
          
            Alamofire.request(urlString, method: .post, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
              print(response)
                
                if let json = response.result.value as? [String:Any]
                {
//                    var feed  = json["feed"]

                
                }
            }
            
        }
            }
            
        }
