//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import UIKit

class WelcomeViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var startButton: UIButton!
  
  var viewModel: WelcomeViewModel? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

typealias Actions = WelcomeViewController
extension Actions {
  @IBAction func onTextFieldEditing(_ sender: UITextField) {
    
  }
  @IBAction func onStartButtonPressed(_ sender: Any) {
    viewModel?.startAction()
  }
}
