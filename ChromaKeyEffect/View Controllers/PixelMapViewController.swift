import UIKit

class PixelMapViewController: UIViewController {
    
    var unformattedImage: CIImage?
    var mappedImage = CIImage()
    let chromaKey = ChromaKey()
    let mappedImageView = MappedImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        self.mappedImageView.createCompositeButton.addTarget(self, action: #selector(createCompositeImage), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let unfilteredImage = unformattedImage {
            let filteredImage = self.chromaKey.filterPixels(foregroundCIImage: unfilteredImage)
            mappedImage = filteredImage

            mappedImageView.processedImageView.image = UIImage(ciImage: filteredImage)
        }
    }

    init(image: CIImage) {
        super.init(nibName: nil, bundle: nil)
        self.unformattedImage = image
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    @objc func createCompositeImage() {
        print("processing")
        let compositeImageVC = CompositeImageViewController(image: mappedImage)
            print("completed")
            self.present(compositeImageVC, animated: true, completion: nil)
    }

    private func setupViews() {
        setupMappedImageView()
    }

    private func setupMappedImageView() {
        view.addSubview(mappedImageView)
        mappedImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mappedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mappedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mappedImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mappedImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
