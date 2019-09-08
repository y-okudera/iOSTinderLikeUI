//
//  CardPicksViewController.swift
//  iOSTinderLikeUI
//
//  Created by Yuki Okudera on 2019/09/01.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Koloda
import UIKit

// MARK: - protocol

protocol CardPicksView: class {
    func reloadKolodaView()
}

// MARK: - class

/// カード選択画面
final class CardPicksViewController: UIViewController {
    
    @IBOutlet weak var kolodaView: KolodaView!
    // Presenterへのアクセスはprotocolを介して行う
    var presenter: CardPicksPresentation!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kolodaView.delegate = self
        kolodaView.dataSource = self
        kolodaView.isLoop = true
        
        presenter.viewDidLoad()
    }
}

extension CardPicksViewController: CardPicksView {

    func reloadKolodaView() {
        kolodaView.reloadData()
    }
}

extension CardPicksViewController: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return presenter.images.count
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let imageView = UIImageView(image: presenter.images[index])
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }
}

extension CardPicksViewController: KolodaViewDelegate {

    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }

    func koloda(_ koloda: Koloda.KolodaView, didSwipeCardAt index: Int, in direction: Koloda.SwipeResultDirection) {

        switch direction {
        case .left:
            print("\(index): Nooooo")
        case .right:
            print("\(index): Yeeeees")
        default:
            print("\(index): Othersssss")
        }
    }

    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIAlertController.alert(on: self, title: "Tapped!!", message: "index: \(index)")
    }
}
