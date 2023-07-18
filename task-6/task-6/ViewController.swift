//
//  ViewController.swift
//  task-6
//
//  Created by Ахмеров Дмитрий Николаевич on 18.07.2023.
//

import UIKit

final class ViewController: UIViewController {

	private lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)

	private lazy var snapBehavior = UISnapBehavior(item: squareView, snapTo: view.center)

	private lazy var squareView: UIView = {
		let view = UIView()
		view.bounds.size = .init(width: 100, height: 100)
		view.layer.cornerRadius = 10
		view.backgroundColor = .systemBlue

		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(squareView)
		squareView.center = view.center
		dynamicAnimator.addBehavior(snapBehavior)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touchCoordinates = touches.first?.location(in: view) else { return }
		snapBehavior.snapPoint = touchCoordinates
	}
}
