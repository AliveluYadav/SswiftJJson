//
//  APIManager.swift
//  SswiftJJson
//
//  Created by LetMeCall Corp on 17/12/18.
//  Copyright © 2018 LetMeCall Corp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManagr: NSObject {
    
    class func apiMultipart(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (JSON?, NSError?) -> ()) {
        
        Alamofire.upload(multipartFormData: { (multipartFormData:MultipartFormData) in
            for (key, value) in parameters! {
                if key == "imageName" {
                    multipartFormData.append(
                        value as! Data,
                        withName: key,
                        fileName: "swift_file.jpg",
                        mimeType: "image/jpg"
                    )
                } else {
                    //Data other than image
                    multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
                }
            }
        }, usingThreshold: 1, to: serviceName, method: .post, headers: ["":""]) { (encodingResult:SessionManager.MultipartFormDataEncodingResult) in
            
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if response.result.error != nil {
                        completionHandler(nil,response.result.error as NSError?)
                        return
                    }
                    print(response.result.value!)
                    if let data = response.result.value {
                        let json = JSON(data)
                        completionHandler(json,nil)
                    }
                }
                break
                
            case .failure(let encodingError):
                print(encodingError)
                completionHandler(nil,encodingError as NSError?)
                break
            }
        }
    }
}
