//
//  ViewController.swift
//  NTBin
//
//  Created by gbstar on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func nextButtonTapped() {
        // 탭바컨트롤러의 생성
        let tabBarVC = UITabBarController()
        
        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        let vc5 = FifthViewController()
        
        // 탭바 이름들 설정
        vc1.title = "Main"
        vc2.title = "Search"
        vc3.title = "Post"
        vc4.title = "Likes"
        vc5.title = "Me"
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "square.and.arrow.up")
        items[1].image = UIImage(systemName: "folder")
        items[2].image = UIImage(systemName: "paperplane")
        items[3].image = UIImage(systemName: "doc")
        items[4].image = UIImage(systemName: "note")
        
        // 프리젠트로 탭바를 띄우기
        present(tabBarVC, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeUI()
    }

    func makeUI() {
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

