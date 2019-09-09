//
//  ViewController.swift
//  Artable
//
//  Created by MIREIA PEREZ BARROS on 09/09/2019.
//  Copyright © 2019 mpb. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Present login storyboard
        let loginStoryboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let loginController = loginStoryboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(loginController, animated: true, completion: nil)
    }


}

