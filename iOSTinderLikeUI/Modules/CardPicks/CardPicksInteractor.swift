//
//  CardPicksInteractor.swift
//  iOSTinderLikeUI
//
//  Created by YukiOkudera on 2019/09/08.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation

// MARK: - protocol

/// API・DBからデータを取得する
protocol CardPicksUsecase {
    /// 画像を取得する
    func fetchImages()
}

/// 処理結果をPresenterに通知する
protocol CardPicksInteractorDelegate: class {
    func didFetchImages(imageNames: [String])
}

// MARK: - class

final class CardPicksInteractor {
    weak var output: CardPicksInteractorDelegate?
}

extension CardPicksInteractor: CardPicksUsecase {

    func fetchImages() {
        // 画像の取得結果を通知する
        output?.didFetchImages(imageNames: ["1", "2", "3"])
    }
}
