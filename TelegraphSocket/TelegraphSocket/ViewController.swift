//
//  ViewController.swift
//  TelegraphSocket
//
//  Created by Mike Mikina on 7/17/18.
//  Copyright © 2018 FDT. All rights reserved.
//

import Cocoa
import Telegraph

class ViewController: NSViewController, ServerWebSocketDelegate {

  var server: Server?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.server = Server()
    server?.webSocketDelegate = self
    
    do {
      try server?.start(onPort: 8080)
    }
    catch {
      print(error)
    }
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
  // MARK: - ServerWebSocketDelegate
  
  func server(_ server: Server, webSocketDidConnect webSocket: WebSocket, handshake: HTTPRequest) {
    if let path = Bundle.main.path(forResource: "output1", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        webSocket.send(data: data)
      }
      catch {
        print(error)
      }
    }
  }
  
  func server(_ server: Server, webSocketDidDisconnect webSocket: WebSocket, error: Error?) {}
  
  func server(_ server: Server, webSocket: WebSocket, didReceiveMessage message: WebSocketMessage) {}
  
  func server(_ server: Server, webSocket: WebSocket, didSendMessage message: WebSocketMessage) {}
  
  func serverDidDisconnect(_ server: Server) {}
}

