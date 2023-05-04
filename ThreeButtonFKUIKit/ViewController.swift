//
//  ViewController.swift
//  ThreeButtonFKUIKit
//
//  Created by Сергей Прокопьев on 05.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeButton(with: "First Button"),
            makeButton(with: "Second Medeum Button"),
            makeButton(with: "Third", shouldAddAction: true)
        ])
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)
        view.backgroundColor = .white
        setupLayout()
    }

    // MARK: - Private

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func makeButton(with title: String, shouldAddAction: Bool = false) -> UIButton {
        let button = CustomButton(frame: .zero)
        button.setTitle(title, for: .normal)
        if shouldAddAction {
            button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        }
        return button
    }

    @objc private func buttonDidTap(_ sender: UIButton) {
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .white
        present(vc, animated: true)
    }
}
