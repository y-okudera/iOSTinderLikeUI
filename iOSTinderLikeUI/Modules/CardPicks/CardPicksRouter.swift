//
//  CardPicksRouter.swift
//  iOSTinderLikeUI
//
//  Created by Yuki Okudera on 2019/09/01.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

// MARK: - protocol

protocol CardPicksWireframe: class {
    // Implement the screen transition method.
}

// MARK: - class

final class CardPicksRouter {

    weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    /// 依存関係の解決をする
    static func assembleModules() -> UIViewController {
        let view: CardPicksViewController = .instantiate()
        let interactor = CardPicksInteractor()
        let router = CardPicksRouter(viewController: view)
        let presenter = CardPicksPresenter(view: view, interactor: interactor, router: router)
        // Interactorの通知先にPresenterを設定
        interactor.output = presenter
        // ViewにPresenterを設定
        view.presenter = presenter
        
        return view
    }
}

extension CardPicksRouter: CardPicksWireframe {
    
}
