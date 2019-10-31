//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import Foundation

enum MessageEvent: String {
  
  case connectUser; struct ConnectUserData {
    let userId: User.ID
    let name: String
  }
  case createChat; struct CreateChatData {
    let userId: User.ID
    let title: String
  }
  case joinChat; struct JoinChatData {
    let userId: User.ID
    let chatId: String
  }
  case messageSent; struct MessageSentData {
    let userId: User.ID
    let chatId: String
    let text: String
  }
  case userViewedMessage; struct UserViewedMessageData {
    let userId: User.ID
    let messageId: String
  }
  case disconnectUser; struct DisconnectUserData {
    let userId: User.ID
  }
}
