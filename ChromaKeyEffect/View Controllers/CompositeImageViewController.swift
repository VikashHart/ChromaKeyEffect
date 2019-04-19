import UIKit

class CompositeImageViewController: UIViewController {

    var formattedImage: CIImage?
    var imageArray = [UIImage]()
    let chromaKey = ChromaKey()
    let compositedImageView = CompositedImageView()
    let serialQueue = DispatchQueue(label: "backgroundThread")

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
                self.imageArray.append(UIImage(ciImage: compositedImage))

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

    @objc func share() {
        let items = imageArray
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
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
