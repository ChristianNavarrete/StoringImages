//
//  ViewController.swift
//  Image Download
//
//  Created by HoodsDream on 4/8/15.
//  Copyright (c) 2015 HoodsDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let url = NSURL(string: "http://okp-cdn.okayplayer.com/wp-content/uploads/2013/03/kendrick-lamar-lead1.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            
            if error != nil {
                
                println("There was an error")
                
            } else {
                
                let image = UIImage(data: data)
                
                var documentsDirectory:String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    documentsDirectory = paths[0] as? String
                    
                    var savePath = documentsDirectory! + "/bach.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.image.image = UIImage(named: savePath)
                                        
                }
                
            }
            
            
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

