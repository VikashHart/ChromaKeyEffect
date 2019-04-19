import UIKit

class CompositedImageView: UIView {

    lazy var originalImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "squidward_green_screen")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var downArrowImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "down_arrow")?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var compositedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var upArrowImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "up_arrow")?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "underwater")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        setupCompositeImageView()
        setupDownArrowImageView()
        setupUpArrowImageView()
        setupOriginalImageView()
        setupBackgroundImageView()
    }

    private func setupCompositeImageView() {
        addSubview(compositedImageView)
        NSLayoutConstraint.activate([
            compositedImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            compositedImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            compositedImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            compositedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            compositedImageView.heightAnchor.constraint(equalToConstant: 205)
            ])
    }

    private func setupDownArrowImageView() {
        addSubview(downArrowImageView)
        NSLayoutConstraint.activate([
            downArrowImageView.bottomAnchor.constraint(equalTo: compositedImageView.topAnchor, constant: -20),
            downArrowImageView.heightAnchor.constraint(equalToConstant: 40),
            downArrowImageView.widthAnchor.constraint(equalToConstant: 40),
            downArrowImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }

    private func setupUpArrowImageView() {
        addSubview(upArrowImageView)
        NSLayoutConstraint.activate([
            upArrowImageView.topAnchor.constraint(equalTo: compositedImageView.bottomAnchor, constant: 20),
            upArrowImageView.heightAnchor.constraint(equalToConstant: 40),
            upArrowImageView.widthAnchor.constraint(equalToConstant: 40),
            upArrowImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }

    private func setupOriginalImageView() {
        addSubview(originalImageView)
        NSLayoutConstraint.activate([
            originalImageView.bottomAnchor.constraint(equalTo: downArrowImageView.topAnchor, constant: -20),
            originalImageView.heightAnchor.constraint(equalToConstant: 180),
            originalImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            originalImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            originalImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }

    private func setupBackgroundImageView() {
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: upArrowImageView.bottomAnchor, constant: 20),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 180),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
