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
}
