//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import Foundation
import SocketIO

protocol MessageServiceProtocol {
  func connect()
  func connectUser(name: String)
  func createChat(userId: User.ID, title: String)
  func joinChat(userId: User.ID, chatId: String)
  func messageSent(userId: User.ID, chatId: String, text: String)
  func userViewedMessage(userId: User.ID, messageId: String)
  func disconnectUser(userId: User.ID)
}

class MessageService: MessageServiceProtocol {
  
  private let socketIOService: SocketIOService
  
  init(onEffect: @escaping () -> ()) {
    socketIOService = SocketIOService(onEffect: onEffect)
  }
  
  func connect() {
    socketIOService.connect()
  }
  
  func connectUser(name: String) {
    socketIOService.emitEvent(MessageEvent.connectUser.rawValue,
                              with: ["name" : name])
  }
  func createChat(userId: User.ID, title: String) {
    socketIOService.emitEvent(MessageEvent.createChat.rawValue,
                              with: ["userId" : userId.value,
                                     "title" : title])
  }
  func joinChat(userId: User.ID, chatId: String) {
    socketIOService.emitEvent(MessageEvent.joinChat.rawValue,
                              with: ["userId" : userId.value,
                                     "chatId" : chatId])
  }
  func messageSent(userId: User.ID, chatId: String, text: String) {
    socketIOService.emitEvent(MessageEvent.messageSent.rawValue,
                              with: ["userId" : userId.value,
                                     "chatId" : chatId,
                                     "text" : text])
  }
  func userViewedMessage(userId: User.ID, messageId: String) {
    socketIOService.emitEvent(MessageEvent.userViewedMessage.rawValue,
                              with: ["userId" : userId.value,
                                     "messageId" : messageId])
  }
  func disconnectUser(userId: User.ID) {
    socketIOService.emitEvent(MessageEvent.disconnectUser.rawValue,
                              with: ["userId" : userId.value])
  }
}
