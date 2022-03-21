//
//  NetworkMonitor.swift
//  Random User
//
//  Created by Александр Иванов on 21.03.2022.
//

import Foundation
import Network

final class NetworkMonitor {
    //MARK: - Properties
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
 
}
