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
  
  
  @IBAction func sGameStratingButton(sender: AnyObject) {
    
    //startingButton has be hidden and snake move around
    if(startButton.hidden == false){
      startButton.hidden = true;
      print("startButton is hidden");
      
      //snake movement
      UIImageView.animateWithDuration(0.1, delay: 1.0, options: UIViewAnimationOptions.CurveLinear, animations:{ self.sHead.frame.origin.x = 1.0; self.sHead.alpha = 1 }, completion:{
          (startButton) in self.sHead.transform = CGAffineTransformMakeRotation(0)});
      
      
      for var i=0; i<snake.count; i++ {
        print(snake);
      }
      
     // NSRunLoop.currentRunLoop().addTimer(snakeTimer, forMode: NSRunLoopCommonModes);
      
      let sPoint = String(point);
      self.sScoreLabel.text = "Score: \(sPoint)";
      
      checkBoundry(gameBackGround);
    }
    
  }
  
  
  func checkBoundry(x: UIImageView){
    //while(true){
      if(snake[0].frame.origin.x == 0 || snake[0].frame.origin.x == 568.0){
        reset();
      }else if(snake[0].frame.origin.y == 0 || snake[0].frame.origin.y == 320.0){
        reset();
      }
    //}
  }
  
  //helper method for counting timer
//  func countUp(){
//    
//    binaryCount += 0b0001;
//    if(binaryCount == 0b0001){
//      binaryCount = 0b0000;
//    }
//  }
  
  func reset(){
    //snakeTimer.invalidate();
    //binaryCount = 0b0000;
    
    //restart game
    //startButton.hidden = false;
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //    let image = UIImage(named: "sStartingPage.png");
    //    let imageview = UIImageView(image: image);
    //    self.view.addSubview(imageview);
    
    startButton.hidden = false;
    snake += [sHead];
    self.view.addSubview(gameBackGround);
    self.view.addSubview(startButton);
    self.view.addSubview(sHead);
    self.view.addSubview(sScoreLabel);
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  

}