//
//  Connector.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 30..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class Connector{
    
    let baseUrl = "http://52.78.115.181:7001"
    static var instance = Connector()
    
    private init(){}
    
    func uploadImage(_ request: URLRequest, images: [ImageModel]) -> Observable<Int>{
        var request = request
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createImageBody(images, boundary: boundary)
        return requestData(request).do{ [unowned self] in self.setNetIndi(true) }
            .flatMapFirst{ return Observable.just($0.0.statusCode) }
            .observeOn(MainScheduler.instance)
            .do{ [unowned self] in self.setNetIndi(false) }
    }
    
    func request(_ request: URLRequest) -> Observable<(Int, Data?)>{
        return requestData(request).do{ [unowned self] in self.setNetIndi(true) }
            .flatMapFirst{ return Observable.just(($0.0.statusCode, $0.1)) }
            .observeOn(MainScheduler.instance)
            .do{ [unowned self] in self.setNetIndi(false) }
    }
    
}

extension Connector{
    
    private func setNetIndi(_ set: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = set
    }
    
    private func createImageBody(_ images: [ImageModel], boundary: String) -> Data{
        let lineBreak = "\r\n"
        var body = Data()
        
        for image in images{
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(image.key)\"; filename=\"\(image.fileName)\"\(lineBreak)")
            body.append("Content-Type: \(image.type + lineBreak + lineBreak)")
            body.append(image.data)
            body.append(lineBreak)
        }
        body.append("--\(boundary)--\(lineBreak)")
    
        return body
    }
    
    public func createRequest(sub: String, method: RequestMethod, params: [String : String]) -> URLRequest{
        var urlStr = baseUrl + sub
        var paramStr = ""
        for param in params{ paramStr += param.key + "=" + param.value + "," }
        if !paramStr.isEmpty{ paramStr.removeLast() }
        if method == .get{ urlStr += paramStr }
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = method.rawValue
        if method != .get{ request.httpBody = paramStr.data(using: .utf8) }
        return request
    }
    
}

enum RequestMethod: String{
    
    case get = "GET"
    case post = "POST"
    
}

extension Data{
    
    fileprivate mutating func append(_ string: String) {
        append(string.data(using: .utf8)!)
    }
    
}
