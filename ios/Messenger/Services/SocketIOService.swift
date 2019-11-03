//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import Foundation
import SocketIO

class SocketIOService {
  
  let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!,
                              config: [.log(true)])
  
  let onEffect: () -> ()
  
  init(onEffect: @escaping () -> ()) {
    self.onEffect = onEffect
    manager.defaultSocket.on("effect") { [weak self] (items, emiterr) in
      self?.onEffect()
      guard let items = items as? [[String: Any]] else { return }
      _ = items.first?["type"]
      _ = items.first?["effect"]
    }
  }
  
  private(set) var isConnected: Bool = false
  
  func connect() {
    manager.defaultSocket.connect()
    
    manager.defaultSocket.on(clientEvent: .connect) { [weak self] data, ack in
      self?.isConnected = true
    }
  }
  
  func disconnect() {
    manager.defaultSocket.disconnect()
    manager.defaultSocket.on(clientEvent: .disconnect) { [weak self] data, ack in
      self?.isConnected = false
    }
  }
  
  func emitEvent(_ event: String, with data: SocketData) {
    manager.defaultSocket.emit("event", ["type" : event,
                                         "event" : data])
  }
}
