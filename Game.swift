//
//  Game.swift
//  Snake
//
//  Created by ze li on 11/23/15.
//  Copyright © 2015 ze li. All rights reserved.
//
import UIKit
import Foundation

class Game: UIViewController{
  
  
  @IBOutlet weak var downButtonDisplay: UIButton!
  @IBOutlet weak var leftButtonDisplay: UIButton!
  @IBOutlet weak var upButtonDisplay: UIButton!
  @IBOutlet weak var rightButtonDisplay: UIButton!
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var sScoreLabel: UILabel!
  @IBOutlet weak var sHead: UIImageView!
  @IBOutlet weak var gameBackGround: UIImageView!
  
  //var snakeTimer = NSTimer();
  //var binaryCount = 0b0000;
  //snake array
  var snake: [UIImageView] = [];
  
  //point
  var point = 0;
  
  //location5
  var cgfloat = CGFloat(20);
  
  //rect 
  var Rect = UIView(frame: CGRectMake(20,20,520,280));

  
  
  
  @IBAction func leftButton(sender: AnyObject){
//    var destX:CGFloat = self.view.bounds.width / 2;
//    UIView.animateWithDuration(Float(0.5), delay: 1.0, animations: {
//    self.sHead.center.x})
//      completion: nil);
    //print(startButton.hidden);
    
    if(startButton.hidden){
      print("left");
      sHead.frame.origin.x -= cgfloat;
      checkBoundary(Rect);
    }
  }
  
  @IBAction func rightButton(sender: AnyObject){
    if(startButton.hidden){
      print("right");
      sHead.frame.origin.x += cgfloat;
      checkBoundary(Rect);
    }
  }
  
  @IBAction func upButton(sender: AnyObject){
    if(startButton.hidden){
      print("up");
      sHead.frame.origin.y -= cgfloat;
      checkBoundary(Rect);
    }
  }
  
  @IBAction func downButton(sender: AnyObject){
    if(startButton.hidden){
      print("down");
      sHead.frame.origin.y += cgfloat;
      checkBoundary(Rect);
    }
  }
  
  @IBAction func sGameStratingButton(sender: AnyObject) {
    
    
    //startingButton has be hidden and snake move around
    if(startButton.hidden == false){
      startButton.hidden = true;
      print("startButton is hidden");
      
      
      for var i=0; i<snake.count; i++ {
        print(snake[0].frame.origin.x);
        print("\(self.sHead.center.x)")
      }
      
      let sPoint = String(point);
      self.sScoreLabel.text = "Score:  \(sPoint)";
      checkBoundary(Rect);
    }
    
  }
  
  //checkBoundary
  func checkBoundary(x: UIView){
    
      if(snake[0].frame.origin.x < x.frame.origin.x ||
        snake[0].frame.origin.x > x.frame.width){ reset(); }
      
      else if(snake[0].frame.origin.y < x.frame.origin.y ||
        snake[0].frame.origin.y > x.frame.height){ reset(); }
  }
  
  func reset(){
    //restart game
    startButton.hidden = false;
    viewDidLoad();
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //    let image = UIImage(named: "sStartingPage.png");
    //    let imageview = UIImageView(image: image);
    //    self.view.addSubview(imageview);
    
    startButton.hidden = false;
    snake += [sHead];
    Rect.layer.borderWidth = 1.0;
    Rect.layer.borderColor = UIColor.blackColor().CGColor;
    
    self.view.addSubview(gameBackGround);
    self.view.addSubview(Rect);
    self.view.addSubview(startButton);
    self.view.addSubview(sHead);
    self.view.addSubview(sScoreLabel);
    self.view.addSubview(rightButtonDisplay);
    self.view.addSubview(leftButtonDisplay);
    self.view.addSubview(upButtonDisplay);
    self.view.addSubview(downButtonDisplay);
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  

}