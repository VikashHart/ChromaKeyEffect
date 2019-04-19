import UIKit

class MappedImageView: UIView {

    lazy var processedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var createCompositeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Composite Image", for: .normal)
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
        addSubview(processedImageView)
        NSLayoutConstraint.activate([
            processedImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            processedImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            processedImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            processedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            processedImageView.heightAnchor.constraint(equalToConstant: 205)
            ])
    }

    private func setupButton() {
        addSubview(createCompositeButton)
        NSLayoutConstraint.activate([
            createCompositeButton.topAnchor.constraint(equalTo: processedImageView.bottomAnchor, constant: 30),
            createCompositeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
