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
  
  @IBOutlet weak var snakeBody: UIImageView!
  @IBOutlet weak var downButtonDisplay: UIButton!
  @IBOutlet weak var leftButtonDisplay: UIButton!
  @IBOutlet weak var upButtonDisplay: UIButton!
  @IBOutlet weak var rightButtonDisplay: UIButton!
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var sScoreLabel: UILabel!
  @IBOutlet weak var sHead: UIImageView!
  @IBOutlet weak var sHead1: UIImageView!
  @IBOutlet weak var sHead2: UIImageView!
  @IBOutlet weak var sHead3: UIImageView!
  @IBOutlet weak var sHead4: UIImageView!
  @IBOutlet weak var gameBackGround: UIImageView!
  
  //var snakeTimer = NSTimer();
  //var binaryCount = 0b0000;
  //boolean for checkDirection
  var upDirection = false;
  var downDirection = false;
  var rightDirection = false;
  var leftDirection = false;
  //snake array
  var snake: [UIImageView] = [];
  //point
  var point = 0;
  //location5
  var cgfloat = CGFloat(20);
  //rect 
  var Rect = UIView(frame: CGRectMake(20,20,520,280));
  var sBodyImage = UIImageView();
  let SNAKEWITH = CGFloat(20);
  let SNAKEHEIGHT = CGFloat(20);
  //timer
  var snakeTimer = NSTimer();
  //direction of changing movement
  var dx = CGFloat(20);
  var dy = CGFloat(0);
  var checkDirection = false;
  

  struct Variable{
  }
  
  /**************************
   *                        *
   * Direction: (method)    *
   * MoveLeft, MoveRight,   *
   * MoveUp, MoveDown       *
   *                        *
   **************************/
  
  func  MoveLeft(){
    if(checkDirection == false){
      dy = 0;
      dx = -20;
      //startButton.hidden = true;
      print("move left");
      checkDirection = true;
    }
  }
  
  func  MoveRight(){
    if(checkDirection == false){
      dy = 0;
      dx = 20;
      //startButton.hidden = true;
      print("move right");
      checkDirection = true;
    }
  }
  
  func  MoveUp(){
    if(checkDirection == true){
      dy = -20;
      dx = 0;
      //startButton.hidden = true;
      print("move up");
      checkDirection = false;
    }
  }
  
  func  MoveDown(){
    if(checkDirection == true){
      dy = 20;
      dx = 0;
      //startButton.hidden = true;
      print("move down");
      checkDirection = false;
    }
  }
  
  ///////////////////////////////////////

//  @IBAction func leftButton(sender: AnyObject){
//    if(startButton.hidden){
//      print("left");
//      //sHead.frame.origin.x -= cgfloat;
//      dy = 0;
//      dx = -20;
//      checkBoundary(Rect);
//    
//      upDirection = false;
//      downDirection = false;
//      rightDirection = false;
//      leftDirection = true;
//    }
//  }
//  
//  @IBAction func rightButton(sender: AnyObject){
//    if(startButton.hidden){
//      print("right");
//      //sHead.frame.origin.x += cgfloat;
//      dy = 0;
//      dx = 20;
//      checkBoundary(Rect);
//      
//      upDirection = false;
//      downDirection = false;
//      rightDirection = true;
//      leftDirection = false;
//    }
//  }
//  
//  @IBAction func upButton(sender: AnyObject){
//    if(startButton.hidden){
//      print("up");
//      //sHead.frame.origin.y -= cgfloat;
//      dx = 0;
//      dy = -20;
//      checkBoundary(Rect);
//      
//      upDirection = true;
//      downDirection = false;
//      rightDirection = false;
//      leftDirection = false;
//    }
//  }
//  
//  @IBAction func downButton(sender: AnyObject){
//    if(startButton.hidden){
//      print("down");
//      //sHead.frame.origin.y += cgfloat;
//      dx = 0;
//      dy = 20;
//      checkBoundary(Rect);
//
//      upDirection = false;
//      downDirection = true;
//      rightDirection = false;
//      leftDirection = false;
//    }
//  }
  
  
  /**************************
   *                        *
   * Game Starting Button:  *
   * (method)               *
   * Action Button to run   *
   * Boolean to check       *
   * NSTimer: to call snake *
   *   moving method        *
   *                        *
   **************************/

  @IBAction func sGameStratingButton(sender: AnyObject) {
    //startingButton has be hidden and snake move around
    if(startButton.hidden == false){
      startButton.hidden = true;
      print("startButton is hidden");
      //point in game
      
      //animation loop for snake moving inside
      snakeTimer = NSTimer.scheduledTimerWithTimeInterval(0.3,
        target: self, selector: "snakeMoving", userInfo: nil, repeats: true);
      
      checkBoundary(Rect);
    }
  }
  
  /**************************
   *                        *
   * Game Score: (method)   *
   * tracking the score     *
   * update score whenever  *
   * snake hits the food    *
   *                        *
   **************************/
  
  func scoreUpdate(){
    let sPoint = String(point);
    self.sScoreLabel.text = "Score:  \(sPoint)";
  }
  
  /**************************
   *                        *
   * Snake Growth: (method) *
   *   direction update     *
   *  to check if snake     *
   *  need body added       *
   *                        *
   **************************/

  func growth(x: UIImageView){
    if(rightDirection){
      if(sHead.frame.origin.x == (x.frame.origin.x + 20.0) &&
          sHead.frame.origin.y == x.frame.origin.y ){
            //snakeBody.hidden = true;
            snake.append(snakeBody);
            snakeBody.hidden = true;
            //add animation
            }
          //RandomSnakeBody();
     }
    if(leftDirection){
      if(sHead.frame.origin.x == (x.frame.origin.x - 20.0) &&
        sHead.frame.origin.y == x.frame.origin.y){
        RandomSnakeBody();
      }
    }
    if(upDirection){}
    if(downDirection){}
  }
  
  /**************************
   *                        *
   * Boundary: (method)     *
   * check each boundary    *
   * if the snake hit       *
   * boundray, then need    *
   * restart new game       *
   *                        *
   **************************/
 
  func checkBoundary(x: UIView){
      if(snake[0].frame.origin.x < x.frame.origin.x ||
        snake[0].frame.origin.x > x.frame.width){ reset(); }
      else if(snake[0].frame.origin.y < x.frame.origin.y ||
        snake[0].frame.origin.y > x.frame.height){ reset(); }
  }
  
  /**************************
   *                        *
   * Snake Moving (method)  *
   *                        *
   * snakeMoving()          *
   *    Give UIImageView    *
   *    to have their       *
   *    movement and check  *
   *    collisions by using *
   *   CGRectIntersectsRect *
   *                        *
   **************************/

  func snakeMoving(){
    let sX = self.sHead.frame.origin.x;
    let sY = self.sHead.frame.origin.y;
    //let sSize = self.sHead.frame.size;
    sHead3.frame = CGRectMake(sHead2.frame.origin.x, sHead2.frame.origin.y, SNAKEWITH, SNAKEHEIGHT);
    sHead2.frame = CGRectMake(sHead1.frame.origin.x, sHead1.frame.origin.y, SNAKEWITH, SNAKEHEIGHT);
    sHead1.frame = CGRectMake(sHead.frame.origin.x, sHead.frame.origin.y, SNAKEWITH, SNAKEHEIGHT);
    sHead.frame = CGRectMake(sX+dx, sY+dy, SNAKEWITH, SNAKEHEIGHT);
  
    
    if(CGRectIntersectsRect(snake[0].frame, snakeBody.frame)){
      print("The snake head has collision with food");
      snakeBody.hidden = true;
      RandomSnakeBody();
      snake.append(snakeBody);
      //place the food in the grid
    }
    
    //sHead4.frame = CGRectMake(sHead3.frame.origin.x, sHead3.frame.origin.y, SNAKEWITH, SNAKEHEIGHT);
  }
  
  /**************************
   *                        *
   * viewDidLoad()          *
   * run once before every  *
   * methods started        *
   *                        *
   **************************/

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //clear array
    if(!snake.isEmpty){
      snake.removeAll();
    }
    
    startButton.hidden = false;
    snake.append(sHead);
    snake.append(sHead1);
    snake.append(sHead2);
    snake.append(sHead3);
    Rect.layer.borderWidth = 1.0;
    Rect.layer.borderColor = UIColor.blackColor().CGColor;
    
    self.view.addSubview(gameBackGround);
    self.view.addSubview(Rect);
    //self.view.addSubview(rightButtonDisplay);
    //self.view.addSubview(leftButtonDisplay);
    //self.view.addSubview(upButtonDisplay);
    //self.view.addSubview(downButtonDisplay);
    self.view.addSubview(sScoreLabel);
    self.view.addSubview(startButton);
    self.view.addSubview(snakeBody);
    self.view.addSubview(sBodyImage);
    self.view.addSubview(snake[0]);
    self.view.addSubview(snake[1]);
    self.view.addSubview(snake[2]);
    self.view.addSubview(snake[3]);
    
    var i = 0;
    while i < snake.count{
      print(snake[i]);
      i++;
    }

    swipeDirection();
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning();
    // Dispose of any resources that can be recreated.
  }
  
  /****************************
   *                          *
   * swipeDirection()         *
   *                          *
   * create object            *
   * UISwipeGertureRecognizer *
   * to make screen response  *
   * the actions              *
   *                          *
   ****************************/
  func swipeDirection(){
    
    checkDirection = true;
    
    let sLeft = UISwipeGestureRecognizer(target: self, action: Selector("MoveLeft"));
    sLeft.direction = UISwipeGestureRecognizerDirection.Left;
    self.view.addGestureRecognizer(sLeft);
    
    let sRight = UISwipeGestureRecognizer(target: self, action: Selector("MoveRight"));
    sRight.direction = UISwipeGestureRecognizerDirection.Right;
    self.view.addGestureRecognizer(sRight);
    
    let sUp = UISwipeGestureRecognizer(target: self, action: Selector("MoveUp"));
    sUp.direction = UISwipeGestureRecognizerDirection.Up;
    self.view.addGestureRecognizer(sUp);
    
    let sDown = UISwipeGestureRecognizer(target: self, action: Selector("MoveDown"));
    sDown.direction = UISwipeGestureRecognizerDirection.Down;
    self.view.addGestureRecognizer(sDown);
    
  }
  
  
  /**************************
   *                        *
   * RandomSnakeBody()      *
   *  Get random numbers    *
   *  for food providing in *
   *  different positions   *
   *  with cteating new     *
   *  UIImageView object    *
   **************************/
  
  func RandomSnakeBody(){
    let tempX = [20,40,60,80,100,120,140,160,180,200,220,
      240,260,280,300,320,340,360,380,400,420,440,460,480,500,520];
    let tempY = [20,40,60,80,100,120,140,160,180,200,220,240,260,280,300,320];
    var X = arc4random_uniform(520);
    var Y = arc4random_uniform(280);
    
    while(!(tempX.contains(Int(X)))){
      X = arc4random_uniform(520);
    }
    
    while(!(tempY.contains(Int(Y)))){
      Y = arc4random_uniform(280);
    }
    
    let rX = CGFloat(X);
    let rY = CGFloat(Y);
    
    sBodyImage.frame = CGRectMake(rX,rY,SNAKEWITH,SNAKEHEIGHT);
    sBodyImage.layer.backgroundColor = UIColor.greenColor().CGColor;
  }

  /**************************
   *                        *
   * reset()                *
   * method does restart    *
   * and reset to very      *
   * begainning of the game *
   *                        *
   **************************/
  
  func reset(){
    //restart game
    startButton.hidden = false;
    viewDidLoad();
  }
  

}