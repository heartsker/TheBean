import UIKit
import Localize
import Utils

final class AccountViewController<View: AccountView>: BaseViewController<View> {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBar(^ControllerLocalization.account, image: "person")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar(^ControllerLocalization.account, image: "person")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
