//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import Foundation
import SocketIO

class MessageService {
  
  private let socketIOService: SocketIOService
  
  init(onEffect: @escaping () -> ()) {
    socketIOService = SocketIOService(onEffect: onEffect)
  }
  
  func connectUser(userId: User.ID, name: String) {
    socketIOService.emitEvent(MessageEvent.connectUser.rawValue, with: ["userId" : userId,
                                                   "name" : name])
  }
  func createChat(userId: User.ID, title: String) {
    socketIOService.emitEvent(MessageEvent.createChat.rawValue, with: ["userId" : userId,
                                                  "title" : title])
  }
  func joinChat(userId: User.ID, chatId: String) {
    socketIOService.emitEvent(MessageEvent.joinChat.rawValue, with: ["userId" : userId,
                                                "chatId" : chatId])
  }
  func messageSent(userId: User.ID, chatId: String, text: String) {
    socketIOService.emitEvent(MessageEvent.messageSent.rawValue, with: ["userId" : userId,
                                                   "chatId" : chatId,
                                                   "text" : text])
  }
  func userViewedMessage(userId: User.ID, messageId: String) {
    socketIOService.emitEvent(MessageEvent.userViewedMessage.rawValue, with: ["userId" : userId,
                                                         "messageId" : messageId])
  }
  func disconnectUser(userId: User.ID) {
    socketIOService.emitEvent(MessageEvent.disconnectUser.rawValue, with: ["userId" : userId])
  }
}
