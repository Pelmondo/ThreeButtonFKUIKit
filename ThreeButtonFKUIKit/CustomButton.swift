//
//  CustomButton.swift
//  ThreeButtonFKUIKit
//
//  Created by Сергей Прокопьев on 05.05.2023.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configuration = createConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: [.allowUserInteraction, .beginFromCurrentState]
                ) {
                    self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }
            } else {
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    options: [.allowUserInteraction, .beginFromCurrentState]
                ) {
                    self.transform = CGAffineTransform.identity
                }
            }
        }
    }

    override func updateConfiguration() {
        super.updateConfiguration()
        guard let configuration = configuration else {
            return
        }

        var updatedConfiguration = configuration
        var foregraudColor = UIColor.white

        switch state {
        case .highlighted:
            updatedConfiguration.baseForegroundColor = foregraudColor
        default:
            updatedConfiguration.background.backgroundColor = tintAdjustmentMode == .dimmed ? .gray : .systemBlue
            foregraudColor = tintAdjustmentMode == .dimmed ? .lightGray : .white
        }

        updatedConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer
        { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = foregraudColor
            return outgoing
        }

        updatedConfiguration.imageColorTransformer = UIConfigurationColorTransformer { _ in
            return foregraudColor
        }

        self.configuration = updatedConfiguration
    }

    // MARK: - Configuration

    private func createConfiguration() -> Configuration {
        var configuration = UIButton.Configuration.gray()

        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 14,
            bottom: 10,
            trailing: 14
        )

        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8

        configuration.background.backgroundColor = .systemBlue
        configuration.baseForegroundColor = .white

        return configuration
    }
}

