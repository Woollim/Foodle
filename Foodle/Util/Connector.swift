//
//  Connector.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 30..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation

class Connector{
    
    let baseUrl = "http://52.78.115.181:7001"
    static var instance = Connector()
    
    private init(){}
    
    func uploadImage(add: String, method: String, images: [ImageModel]){
        var request = URLRequest.init(url: URL.init(string: baseUrl + add)!)
        request.httpMethod = method
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createImageBody(images, boundary: boundary)
        
        URLSession.shared.dataTask(with: request){
            data, res, err in
            print(res)
            print(err)
        }.resume()
    }
    
}

extension Connector{
    
    private func createImageBody(_ images: [ImageModel], boundary: String) -> Data{
        let lineBreak = "/r/n"
        var body = Data()
        
        for image in images{
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name\"\(image.key)\"; filename=\"\(image.fileName)\"\(lineBreak)")
            body.append("Content-Type: \(image.type + lineBreak + lineBreak)")
            body.append(image.data)
            body.append(lineBreak)
        }
        body.append("--\(boundary)--\(lineBreak)")
    
        return body
    }
    
}

extension Data{
    
    public mutating func append(_ string: String) {
        append(string.data(using: .utf8)!)
    }
    
}
