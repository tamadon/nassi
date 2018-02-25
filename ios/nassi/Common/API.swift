//
//  API.swift
//  nassi
//
//  Created by Hideaki Tamai on 2017/08/12.
//  Copyright © 2017年 tamadon. All rights reserved.
//

import Alamofire
import KRProgressHUD

struct API {
    let method: HTTPMethod
    let parameters: Parameters

    init(method: HTTPMethod = .post, parameters: Parameters = [:]) {
        self.method = method
        self.parameters = parameters
    }

    func request(success: (_ data: Dictionary<String, Any>)-> Void, fail: (_ error: Error?)-> Void) {
        let env = ProcessInfo.processInfo.environment
        Alamofire.request(env[Const.envSlackWebhookUrl]!, method: method, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
            switch response.result {
            case .success:
                KRProgressHUD.showSuccess(withMessage: "Success")
            case .failure:
                KRProgressHUD.showError(withMessage: "Error")
            }
        }
    }
}
