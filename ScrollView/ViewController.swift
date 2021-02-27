//
//  ViewController.swift
//  ScrollView
//
//  Created by mamidisetty Vikash on 04/02/21.
//

import UIKit

class ViewController: UIViewController {

    var requestObj:URLRequest!
    //Creating Global variables for sessionDataTask
    var dataTaskObj:URLSessionDataTask!
    //Buttons
    var btnActor:UIButton!
    var btnCities:UIButton!
    var btnQuotes:UIButton!
    var btnStates:UIButton!
    var btnMovies:UIButton!
    //var actorView:UIView!
    var scrl:UIScrollView!
    //Labels for Actors
    var actorsLabel1:UILabel!
    var citiesLabel1:UILabel!
    //Labels for Quotes
    var quotesLabel1:UILabel!
    //Labels for States
    var statesLabel1:UILabel!
    //Labels for Movies
    var moviesLabel1:UILabel!
    var moviesLabel2:UILabel!
    var moviesLabel3:UILabel!
    //var detaillbl:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Calling Base function for UI Design
        //print ("hi")
        createUI()
        // Do any additional setup after loading the view.
    }
    func createUI(){
    //UI for Actors
    //actorView=UIView()
    scrl=UIScrollView()
    
    scrl.frame = view.frame
    scrl.contentSize = CGSize(width: 10, height: 3500)
    scrl.backgroundColor = UIColor.systemTeal
    view.addSubview(scrl)
        
        

    btnActor = UIButton(type: UIButton.ButtonType.system)
    btnActor.frame=CGRect(x: 130, y: 80, width: 150, height: 40)
    btnActor.setTitleColor(.blue, for: .normal)
    btnActor.setTitle("Actors", for: UIControl.State.normal)
    btnActor.backgroundColor=UIColor.systemOrange
    btnActor.layer.masksToBounds = true
    btnActor.layer.cornerRadius = 8
    btnActor.layer.borderWidth = 1
    btnActor.layer.borderColor = UIColor.blue.cgColor
    btnActor.addTarget(self, action: #selector(onClick), for:UIControl.Event.touchUpInside)
    scrl.addSubview(btnActor)
        
        
    btnCities = UIButton(type: UIButton.ButtonType.system)
    btnCities.frame=CGRect(x: 130, y: 630, width: 150, height: 40)
    btnCities.setTitleColor(.blue, for: .normal)
    btnCities.setTitle("Cities", for: UIControl.State.normal)
    
    btnCities.layer.masksToBounds = true
    btnCities.layer.cornerRadius = 8
    btnCities.layer.borderWidth = 1
    btnCities.layer.borderColor = UIColor.blue.cgColor
    btnCities.addTarget(self, action: #selector(onClick), for:UIControl.Event.touchUpInside)
    scrl.addSubview(btnCities)
        
        
    btnQuotes = UIButton(type: UIButton.ButtonType.system)
      btnQuotes.frame=CGRect(x: 130, y: 1180, width: 150, height: 40)
      btnQuotes.setTitleColor(.blue, for: .normal)
      btnQuotes.setTitle("Quotes", for: UIControl.State.normal)
      btnQuotes.backgroundColor=UIColor.systemYellow
      btnQuotes.layer.masksToBounds = true
      btnQuotes.layer.cornerRadius = 8
      btnQuotes.layer.borderWidth = 1
      btnQuotes.layer.borderColor = UIColor.blue.cgColor
      btnQuotes.addTarget(self, action: #selector(onClick), for:UIControl.Event.touchUpInside)
      scrl.addSubview(btnQuotes)
        
        btnStates = UIButton(type: UIButton.ButtonType.system)
        btnStates.frame=CGRect(x: 130, y: 2330, width: 150, height: 40)
        btnStates.setTitleColor(.blue, for: .normal)
        btnStates.setTitle("States", for: UIControl.State.normal)
        btnQuotes.backgroundColor=UIColor.systemYellow
        btnStates.layer.masksToBounds = true
        btnStates.layer.cornerRadius = 8
        btnStates.layer.borderWidth = 1
        btnStates.layer.borderColor = UIColor.blue.cgColor
        btnStates.addTarget(self, action: #selector(onClick), for:UIControl.Event.touchUpInside)
        scrl.addSubview(btnStates)
        
        
        btnMovies = UIButton(type: UIButton.ButtonType.system)
        btnMovies.frame=CGRect(x: 130, y: 2880, width: 150, height: 40)
        btnMovies.setTitleColor(.blue, for: .normal)
        btnMovies.setTitle("Movies", for: UIControl.State.normal)
        btnQuotes.backgroundColor=UIColor.systemYellow
        btnMovies.layer.masksToBounds = true
        btnMovies.layer.cornerRadius = 8
        btnMovies.layer.borderWidth = 1
        btnMovies.layer.borderColor = UIColor.blue.cgColor
        btnMovies.addTarget(self, action: #selector(onClick), for:UIControl.Event.touchUpInside)
        scrl.addSubview(btnMovies)
}
    //Declaring Base function for UI Design
    @objc func onClick(tappedBtn:UIButton){
        if(tappedBtn == btnActor){
            
        //Step1:Creating Object for URLRequest
        requestObj=URLRequest(url: URL(string: "https://services.brninfotech.com/tws/Quotes.php")!)
        //Assigning method for object
        requestObj.httpMethod="POST"
        var sendData = "type=actors&quantity=10"
        requestObj.httpBody=sendData.data(using: String.Encoding.utf8)
        //Step2: Creating URLSessionDataTask using URLSession.,
        dataTaskObj=URLSession.shared.dataTask(with: requestObj,completionHandler: {(data,response,error) in
        //Step3: Converting JSON Data into Swift Data
                    do{
                        var convertData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                        print(convertData)
                    
            DispatchQueue.main.async{
                            
                    for i in 0..<convertData.count{
                        self.actorsLabel1=UILabel()
                        self.actorsLabel1.frame=CGRect(x: 130, y:i*50+130, width: 150, height: 40)
                    self.actorsLabel1.backgroundColor=UIColor.systemGray5
                        self.actorsLabel1.layer.masksToBounds = true
                        self.actorsLabel1.layer.cornerRadius = 8
                        self.actorsLabel1.layer.borderWidth = 1
                        self.actorsLabel1.layer.borderColor = UIColor.systemBlue.cgColor
                        self.actorsLabel1.textAlignment = .center
                        self.scrl.addSubview(self.actorsLabel1)
                        self.actorsLabel1.text = convertData[i]
                    }
//                            self.actorsLabel1.text=convertData[0]
//                            self.actorsLabel2.text=convertData[1]
//                            self.actorsLabel3.text=convertData[2]
//                            self.actorsLabel4.text=convertData[3]
                            

                        }
                        print("            ")
                    }catch{
                        print("Something Wents wrong...")
                    }
                    if let httpResponse = response as? HTTPURLResponse{
                                    print(httpResponse.statusCode)
                                }

                    print(data!)
                    })
            dataTaskObj.resume()

        }
        else if(tappedBtn == btnCities){
            //detaillbl.text = "Displaying City names...."
            //Step1:Creating Object for URLRequest
            requestObj=URLRequest(url: URL(string: "https://services.brninfotech.com/tws/IndiaDetails.php?type=cities&quantity=10")!)
            requestObj.httpMethod="GET"
            requestObj.setValue("application/json", forHTTPHeaderField: "Accept")
                //Step2: Creating URLSessionDataTask using URLSession.,
                        dataTaskObj=URLSession.shared.dataTask(with:requestObj,completionHandler: {(data,response,error) in
                            print (data!)
                            print ("Connects to Server")
                            print("            ")

                do{
                    var convertData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                print(convertData)
                DispatchQueue.main.async{
                    for i in 0..<convertData.count{
                                           self.citiesLabel1=UILabel()
                                           self.citiesLabel1.frame=CGRect(x: 130, y:i*50+680, width: 150, height: 40)
                                       self.citiesLabel1.backgroundColor=UIColor.systemGray5
                                           self.citiesLabel1.layer.masksToBounds = true
                                           self.citiesLabel1.layer.cornerRadius = 8
                                           self.citiesLabel1.layer.borderWidth = 1
                                           self.citiesLabel1.layer.borderColor = UIColor.blue.cgColor
                                           self.citiesLabel1.textAlignment = .center
                                           self.scrl.addSubview(self.citiesLabel1)
                                           self.citiesLabel1.text = convertData[i]
                                       }
                    
                    
                                }
                    }catch{
                            print("Something Wents wrong...")
                    }
                            print (response)
            })
            dataTaskObj.resume()
        }
        else if(tappedBtn == btnQuotes){
        //detaillbl.text = "Displaying Quotes..."
        //Step1:Creating Object for URLRequest
                            requestObj=URLRequest(url: URL(string: "https://services.brninfotech.com/tws/Quotes.php")!)

                            requestObj.httpMethod="POST"
                            var sendData = "type=quotes&quantity=10"
                            requestObj.httpBody=sendData.data(using: String.Encoding.utf8)
                        //Step2: Creating URLSessionDataTask using URLSession.,
                            dataTaskObj=URLSession.shared.dataTask(with: requestObj,completionHandler: {(data,response,error) in
                                print (data!)
                                print ("Connects to Server")
                                //Step3: Converting JSON Data into Swift Data
                                do{
                                        var convertData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                                    print(convertData)
    DispatchQueue.main.async{

        for i in 0..<convertData.count{
        self.quotesLabel1=UILabel()
        self.quotesLabel1.frame=CGRect(x: 25, y:i*110+1230, width: 365, height: 100)
        self.quotesLabel1.numberOfLines = 4
        self.quotesLabel1.backgroundColor=UIColor.systemGray5
        self.quotesLabel1.layer.masksToBounds = true
        self.quotesLabel1.layer.cornerRadius = 8
        self.quotesLabel1.layer.borderWidth = 1
        self.quotesLabel1.layer.borderColor = UIColor.blue.cgColor
        self.quotesLabel1.textAlignment = .center
        self.scrl.addSubview(self.quotesLabel1)
        self.quotesLabel1.text = convertData[i]
            }
                            
                                    }
                                    print("            ")
                                }catch{
                                    print("Something Wents wrong...")
                                }
                                if let httpResponse = response as? HTTPURLResponse{
                                                    print(httpResponse.statusCode)
                                                }
                                //print(data!)
                                })

                            dataTaskObj.resume()
                    //        aObj.addValue("Quotes.php", forHTTPHeaderField: "Accept")
                    //        aObj.addValue("Quotes.php", forHTTPHeaderField: "Get")
                    //
                    }
        else if(tappedBtn == btnStates){
            //detaillbl.text = "Displaying State names..."
            //Step1:Creating Object for URLRequest
                        requestObj=URLRequest(url: URL(string: "https://services.brninfotech.com/tws/IndiaDetails.php?type=states&quantity=10")!)

                        requestObj.httpMethod="GET"
                        requestObj.setValue("application/json", forHTTPHeaderField: "Accept")
                        //Step2: Creating URLSessionDataTask using URLSession.,
                    dataTaskObj=URLSession.shared.dataTask(with:requestObj,completionHandler: {(data,response,error) in
                            print (data!)
                            print ("Connects to Server")
                            print("            ")
                //            if let a=a, let dataString =  String(data:a,encoding: .utf8){
                //
                //                print(dataString)
                //            }
                            //Step3: Converting JSON Data into Swift Data
                do{
                                    var convertData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                                    print(convertData)
                DispatchQueue.main.async{
                    
                     for i in 0..<convertData.count{
                    self.statesLabel1=UILabel()
                    self.statesLabel1.frame=CGRect(x: 130, y:i*50+2380, width: 150, height: 40)
                   
                    self.statesLabel1.backgroundColor=UIColor.systemGray5
                    self.statesLabel1.layer.masksToBounds = true
                    self.statesLabel1.layer.cornerRadius = 8
                    self.statesLabel1.layer.borderWidth = 1
                    self.statesLabel1.layer.borderColor = UIColor.blue.cgColor
                    self.statesLabel1.textAlignment = .center
                    self.scrl.addSubview(self.statesLabel1)
                    self.statesLabel1.text = convertData[i]
                                }
                }
                                }catch{
                                    print("Something Wents wrong...")
                            }
                            print (response)
                            if let httpResponse = response as? HTTPURLResponse{
                                                print(httpResponse.statusCode)
                                            }
                            })
                            dataTaskObj.resume()

        }
        else if(tappedBtn == btnMovies){
        //detaillbl.text = "Displaying Movie names..."
        //Step1:Creating Object for URLRequest
        requestObj=URLRequest(url: URL(string: "https://services.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)

        requestObj.httpMethod="GET"
        requestObj.setValue("application/json", forHTTPHeaderField: "Accept")
        //Step2: Creating URLSessionDataTask using URLSession.,
    dataTaskObj=URLSession.shared.dataTask(with:requestObj,completionHandler: {(data,response,error) in
        do{
            var convertData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
                                           print(convertData)
            DispatchQueue.main.async{
                           
            for i in 0..<convertData.count{
                self.moviesLabel1=UILabel()
                self.moviesLabel1.frame=CGRect(x: 130, y:i*50+2930, width: 150, height: 40)
                          
            self.moviesLabel1.backgroundColor=UIColor.systemGray5
                self.moviesLabel1.layer.masksToBounds = true
                self.moviesLabel1.layer.cornerRadius = 8
                self.moviesLabel1.layer.borderWidth = 1
                self.moviesLabel1.layer.borderColor = UIColor.blue.cgColor
                self.moviesLabel1.textAlignment = .center
                self.scrl.addSubview(self.moviesLabel1)
                self.moviesLabel1.text = convertData[i]["title"] as! String
                                       }
                       }
            }catch{
                print("Something Wents wrong...")
            }
            print (response)
            if let httpResponse = response as? HTTPURLResponse{
            print(httpResponse.statusCode)
            }
        })
        dataTaskObj.resume()
 }
    
     }

}

