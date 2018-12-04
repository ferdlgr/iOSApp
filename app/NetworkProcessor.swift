//
//  NetworkProcessor.swift
//  app
//
//  Created by DELGADO on 12/3/18.
//  Copyright © 2018 DELGADO. All rights reserved.
//

import Foundation
class NetworkProcessor
{
    lazy var configuraton:URLSessionConfiguration=URLSessionConfiguration.default
    lazy var session:URLSession=URLSession(configuration: self.configuraton)
    
    let url:URL
    init(url:URL)
    {
        self.url=url
    }
    typealias JSONDictionaryHandler=(([String:Any]?)->Void)
    
    func downloadJSONFromURL(_ completion:@escaping JSONDictionaryHandler)
    {
        let request=URLRequest(url:self.url)
        let dataTask=session.dataTask(with: request){
            (data,response,error) in
            if(error==nil)
            {
                if let httpResponse=response as? HTTPURLResponse{
                    switch httpResponse.statusCode
                    {
                    case 200:
                        if let data=data{
                        do{
                            let jsonDictionary=try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                            completion(jsonDictionary as? [String:Any])
                        }catch let error as NSError{
                            print("error json process")
                            }
                        
                        }default:
                        print("HTTP Response Code\(httpResponse.statusCode)")
                    }
                }
        
            }
            else
            {
                print("error")
            }
        }
        dataTask.resume()
    }
}
