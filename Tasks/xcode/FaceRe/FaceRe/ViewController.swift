import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  var selectedImage: UIImage!
  
  let faceImage : UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "unknown")
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleToFill
    iv.layer.cornerRadius = 5
    iv.layer.masksToBounds = true
    return iv
  }()
  
  let boton : UIButton = {
    let bt = UIButton(type: .system)
    bt.setTitle("Detectar rostros", for: .normal)
    bt.backgroundColor = UIColor.red
    bt.translatesAutoresizingMaskIntoConstraints = false
    
    bt.addTarget(self, action: #selector(detectFace), for: .touchUpInside)
    return bt
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectImage))
    
    setupLayout()
    
  }
  
  func setupLayout(){
    view.addSubview(faceImage)
    view.addSubview(boton)
    
    faceImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    faceImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    faceImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
    faceImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
    
    boton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    boton.topAnchor.constraint(equalTo: faceImage.bottomAnchor, constant: 20).isActive = true
    boton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
    boton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
  }
  
  @objc func detectFace(){
    let detectFaceView = DetectFaceViewController()
    detectFaceView.selectedImage = selectedImage
    navigationController?.pushViewController(detectFaceView, animated: true)
  }
  
  @objc func selectImage(){
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    present(picker, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let image = info["UIImagePickerControllerOriginalName"] as? UIImage {
      faceImage.image = image
      selectedImage = image
      dismiss(animated: true, completion: nil)
    }
  }
  
}


























