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
    //create singleton
    static let shared = NetworkMonitor()
    
    //monitor must work in queue
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    //make variable visible (read) from outside and private mutable
    public private(set) var isConnected: Bool = false
    
    //MARK: - Initialization
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    //MARK: - Functions
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
