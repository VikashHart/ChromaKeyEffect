import UIKit

class ForegroundView: UIView {

    let greenScreenImage = UIImage(named: "squidward_green_screen")

    lazy var foregroundImageView: UIImageView = {
        let imageView = UIImageView()
        let image = greenScreenImage
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var removeGreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Remove Green", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        setupImageView()
        setupButton()
    }

    private func setupImageView() {
        addSubview(foregroundImageView)
        NSLayoutConstraint.activate([
            foregroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            foregroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            foregroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            foregroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            foregroundImageView.heightAnchor.constraint(equalToConstant: 205)
            ])
    }

    private func setupButton() {
        addSubview(removeGreenButton)
        NSLayoutConstraint.activate([
            removeGreenButton.topAnchor.constraint(equalTo: foregroundImageView.bottomAnchor, constant: 30),
            removeGreenButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
