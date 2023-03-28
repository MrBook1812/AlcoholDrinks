//
//  ViewController.swift
//  AlcoholDrinks
//
//  Created by Kirill Kniga on 27.03.2023.
//

import UIKit

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the results in the Debug aria"
        case .failed:
            return "You can see error in the Debug aria"
        }
    }
}

final class ViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    
    private var drink: Drink?
    
    @IBOutlet var drinkName: UILabel!
    
    @IBOutlet var drinkImage: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed() {
        fetch()
    }
    
}

extension ViewController {
    
    private func fetchImage() {
        guard let drink = drink else { return }
        for drink in drink.drinks {
            guard let url: URL = URL(string: "\(drink.strDrinkThumb ?? "https://i.pinimg.com/originals/7d/30/f5/7d30f511262bc7fccb2d8012273d870b.jpg")") else { return }
            networkManager.fetchImage(from: url) { result in
                switch result {
                case .success(let imageData):
                    self.drinkImage.image = UIImage(data: imageData)
                    print(imageData)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    private func fetch() {
        networkManager.fetch(Drink.self, from: jsonUrl) { [weak self] result in
            switch result {
            case .success(let drink):
                self?.drink = drink
                print(drink)
                self?.configure()
                self?.fetchImage()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func configure() {
        guard let drink = drink else { return }
        for drink in drink.drinks {
            descriptionLabel.text = drink.description
            drinkName.text = drink.strDrink
        }
    }
}

