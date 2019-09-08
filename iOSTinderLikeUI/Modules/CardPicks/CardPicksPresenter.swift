//
//  CardPicksPresenter.swift
//  iOSTinderLikeUI
//
//  Created by Yuki Okudera on 2019/09/03.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation
import UIKit

// MARK: - protocol

protocol CardPicksPresentation: class {
    var images: [UIImage] { get }
    func viewDidLoad()
}

// MARK: - class

final class CardPicksPresenter {

    // View, Interactor, Routerへのアクセスはprotocolを介して行う
    private weak var view: CardPicksView?
    private let interactor: CardPicksUsecase
    private let router: CardPicksWireframe

    private(set) var images = [UIImage]()

    init(view: CardPicksView, interactor: CardPicksUsecase, router: CardPicksWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CardPicksPresenter: CardPicksPresentation {
    
    func viewDidLoad() {
        interactor.fetchImages()
    }
}

extension CardPicksPresenter: CardPicksInteractorDelegate {

    func didFetchImages(imageNames: [String]) {
        let images = imageNames.map { UIImage(named: $0)! }
        self.images = images
        view?.reloadKolodaView()
    }
}
