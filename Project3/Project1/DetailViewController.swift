//
//  DetailViewController.swift
//  Project1
//
//  Created by Hyago Henrique on 22/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var imagemPosition: Int?
    var totalArray: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let position = imagemPosition, let total = totalArray {
            title = "Picture \(position + 1) of \(total)"
        }
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imagetToLoad = selectedImage {
            imageView.image = UIImage(named: imagetToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("image not found")
            return
        }
        
        guard let name = selectedImage else {
            print("name not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, name], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
