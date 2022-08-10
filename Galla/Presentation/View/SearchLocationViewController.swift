//
//  SearchLocationViewController.swift
//  Galla
//
//  Created by Dimas Putro on 10/08/22.
//

import UIKit

class SearchLocationViewController: UIViewController {

  lazy var navbarView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false

    view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//    view.heightAnchor.constraint(equalToConstant: 55).isActive = true

    view.backgroundColor = .white

    return view
  }()

  lazy var cancelButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false

    button.setTitle("Cancel", for: .normal)
    button.setTitleColor(UIColor(named: "color-black"), for: .normal)
    button.setTitleColor(UIColor.systemGray, for: .highlighted)
    button.titleLabel?.font = UIFont(name: "Poppins-regular", size: 14)

    button.addTarget(self, action: #selector(handleCancelTap), for: .touchUpInside)

    return button
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false

    label.text = "Search Location"
    label.font = UIFont(name: "Poppins-SemiBold", size: 14)

    return label
  }()

  lazy var placeholderSearchImage: UIImageView = {
    let img = UIImageView()
    img.translatesAutoresizingMaskIntoConstraints = false
    img.image = UIImage(named: "icon-search")
    img.widthAnchor.constraint(equalToConstant: 18).isActive = true
    img.heightAnchor.constraint(equalToConstant: 18).isActive = true

    return img
  }()

  lazy var searchTextField: UITextField = {
    let tf = UITextField()

    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.backgroundColor = UIColor.systemGray6
    tf.heightAnchor.constraint(equalToConstant: 38).isActive = true
    tf.layer.cornerRadius = 8
    tf.font = UIFont(name: "Poppins-Regular", size: 14)

    tf.placeholder = "City, State, or Country"
    tf.textColor = UIColor.systemGray

    return tf
  }()

  lazy var emptyDataLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false

    label.text = "Type minimum 3 characters"
    label.font = UIFont(name: "Poppins-Regular", size: 14)
    label.textColor = UIColor.systemGray

    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
  }

  private func configureUI() {
    view.backgroundColor = UIColor(named: "color-background")

    view.addSubview(navbarView)
    navbarView.addSubview(cancelButton)
    navbarView.addSubview(titleLabel)
    navbarView.addSubview(searchTextField)

    searchTextField.setLeftImage(imageString: "icon-search", imageType: .named)

    view.addSubview(emptyDataLabel)

    NSLayoutConstraint.activate([
      navbarView.topAnchor.constraint(equalTo: view.topAnchor),
      navbarView.rightAnchor.constraint(equalTo: view.rightAnchor),
      navbarView.leftAnchor.constraint(equalTo: view.leftAnchor),

      cancelButton.topAnchor.constraint(equalTo: navbarView.topAnchor, constant: 15),
      cancelButton.leftAnchor.constraint(equalTo: navbarView.leftAnchor, constant: 15),

      titleLabel.topAnchor.constraint(equalTo: navbarView.topAnchor, constant: 20),
      titleLabel.centerXAnchor.constraint(equalTo: navbarView.centerXAnchor),

      searchTextField.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 10),
      searchTextField.leftAnchor.constraint(equalTo: navbarView.leftAnchor, constant: 15),
      searchTextField.rightAnchor.constraint(equalTo: navbarView.rightAnchor, constant: -15),
      searchTextField.bottomAnchor.constraint(equalTo: navbarView.bottomAnchor, constant: -15),

      emptyDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emptyDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  @objc func handleCancelTap() {
    dismiss(animated: true)
  }
}
