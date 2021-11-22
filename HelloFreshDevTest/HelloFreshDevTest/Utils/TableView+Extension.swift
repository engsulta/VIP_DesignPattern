//
//  TableView+Extension.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 13/11/2021.
//

import UIKit
import Kingfisher

extension UITableView {
    func dequeueReusableCell<T>(indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
            else { fatalError("not able to dequeue cell") }
        return cell
    }

    func register(_ cell: AnyClass, identifier: String? = nil) {
        let nibName = String(describing: cell.self)
        let identifier = identifier ?? nibName
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }

    func update(row: Int = 0, section: Int = 0) {
        let indexPath = IndexPath(row: row, section: section)
        self.beginUpdates()
        self.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        self.endUpdates()
    }
}



class ImagesUtils {

    public static func downloadImage(url: String,
                                     completionHandler: @escaping (_ image: UIImage) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        KingfisherManager.shared.retrieveImage(with: url) { (result) in
            switch result {
            case .success(let imageResult):
                completionHandler(imageResult.image)
            case .failure: break
            }
        }
    }
}

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
    }
}
//
//class ShadowView: UIView {
//    private var shadowLayer: CAShapeLayer!
//    private var cornerRadius: CGFloat = 12
//    private var fillColor: UIColor = .white // the color applied to the shadowLayer, rather than the view's backgroundColor
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if shadowLayer == nil {
//            shadowLayer = CAShapeLayer()
//
//            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//            shadowLayer.fillColor = fillColor.cgColor
//
//            shadowLayer.shadowColor = UIColor.black.cgColor
//            shadowLayer.shadowPath = shadowLayer.path
//            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//            shadowLayer.shadowOpacity = 0.2
//            shadowLayer.shadowRadius = 3
//
//            layer.insertSublayer(shadowLayer, at: 0)
//        }
//    }
//}
