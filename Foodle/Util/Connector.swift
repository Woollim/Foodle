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
    
    // FIXME: URL을 ip 주소로 하게 되는 경우, 앱스토어 심사 가이드에 어긋나는걸로 아는데, 확인해보세요
    let baseUrl = "http://52.78.115.181:7001"
    // FIXME: 싱글턴을 의도하고 하신거라면 'let'으로 선언해도 될듯 보입니다.
    static var instance = Connector()
    
    private init(){}
    
    func uploadImage(_ request: URLRequest, images: [ImageModel]) -> Observable<Int>{
        var request = request
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createImageBody(images, boundary: boundary)
        
        // MARK: 여기는 싱글턴이라서 'unowned'를 사용해도 무리는 없으나, 향후 capturing list를 사용할 때에는 weak을 사용하는것이 안전성 측면에서 좋습니다.
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
