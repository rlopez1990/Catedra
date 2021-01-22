//
//  LoaderView.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

final class LoaderView: UIView {
  private struct Constantes {
        static let colorDeFondo = UIColor.black.withAlphaComponent(0.4)
        static let tamañoIndicadorDeActividad: CGFloat = 40
        static let tamañoDelCuadrado: CGFloat = 80
        static let radioEsquina: CGFloat = 10
    }
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = CGPoint(x: squareView.frame.size.width / 2, y: squareView.frame.size.height / 2)
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.color = .white
        return indicator
    }()
    
    private lazy var squareView: UIView = {
        let helper = ThemeHelper()
        let vista = UIView(frame: CGRect(x: 0,
                                         y: 0,
                                         width: Constantes.tamañoDelCuadrado,
                                         height: Constantes.tamañoDelCuadrado))
        vista.backgroundColor = helper.getMainTintColor(alpha: 0.7)
        vista.clipsToBounds = true
        vista.layer.cornerRadius = Constantes.radioEsquina
        return vista
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
}

// MARK: - Loadable
extension LoaderView: Loadable {
    func addLoadView(inView: UIView) {
        frame = UIScreen.main.bounds
        squareView.center = CGPoint(x: frame.width / 2,
                                    y: frame.height / 2)

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            inView.addSubview(self)
        }
    }

    func removeLoadView() {
        DispatchQueue.main.async { [weak self] in
            self?.removeFromSuperview()
        }
    }
}

// MARK: - Loadable
private extension LoaderView {
    func setupViews() {
        backgroundColor = Constantes.colorDeFondo
        squareView.addSubview(activityIndicatorView)
        addSubview(squareView)
    }
}
