//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import UIKit

class ChatsTableViewCell: UITableViewCell {
  @IBOutlet weak var chatNameLabel: UILabel!
  @IBOutlet weak var lastMessageLabel: UILabel!
  @IBOutlet weak var usersOnlineCountLabel: UILabel!
  
  
  static let reuseIdentifier = "chatsTableViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  func configure(with model: ChatViewModel) {
    chatNameLabel.text = model.chatName
    lastMessageLabel.text = model.chatMessages.last
    usersOnlineCountLabel.text = "\(model.users.count)"
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
