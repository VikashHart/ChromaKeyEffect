import UIKit

class ForegroundViewController: UIViewController {

    private let foregroundView = ForegroundView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        self.foregroundView.removeGreenButton.addTarget(self, action: #selector(removeGreen), for: .touchUpInside)
    }

    @objc func removeGreen() {
        guard let originalImage = foregroundView.greenScreenImage, let image = CIImage(image: originalImage) else { return }
        let pixelFilterVC = PixelMapViewController(image: image)
        self.present(pixelFilterVC, animated: true, completion: nil)
    }

    private func setupViews() {
        setupForegroundView()
    }

    private func setupForegroundView() {
        view.addSubview(foregroundView)
        foregroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foregroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            foregroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foregroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
