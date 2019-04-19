import UIKit

class CompositeImageViewController: UIViewController {

    var formattedImage: CIImage?
    let chromaKey = ChromaKey()
    let compositedImageView = CompositedImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.async {
            if let image = UIImage(named: "underwater"),
                let backgroundImage = CIImage(image: image),
                let filteredImage = self.formattedImage {
                let compositedImage = self.chromaKey.compositeImages(foregroundCIImage: filteredImage, backgroundCIImage: backgroundImage)
                self.compositedImageView.compositedImageView.image = UIImage(ciImage: compositedImage)
            }
        }
    }

    init(image: CIImage) {
        super.init(nibName: nil, bundle: nil)
        self.formattedImage = image
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupViews() {
        setupCompositedImageView()
    }

    private func setupCompositedImageView() {
        view.addSubview(compositedImageView)
        compositedImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compositedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            compositedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            compositedImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            compositedImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
