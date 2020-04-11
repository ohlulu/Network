//
//  EmptyResponseDecision.swift
//  Network
//
//  Created by Nick on 4/11/20.
//  Copyright © 2020 kciNniL. All rights reserved.
//

import Foundation

struct EmptyResponseDecision: Decision {
    
    func shouldApply<Req>(request: Req, data: Data, response: HTTPURLResponse) -> Bool where Req: Request {
        return data.isEmpty
    }
    
    func apply<Req>(request: Req, data: Data, response: HTTPURLResponse, done closure: @escaping (DecisionAction<Req>) -> Void) where Req: Request {
        closure(.next("{}".data(using: .utf8)!, response))
    }
    
}
