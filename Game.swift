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
  
  @IBOutlet weak var snakeBody:          UIImageView!
  @IBOutlet weak var downButtonDisplay:  UIButton!
  @IBOutlet weak var leftButtonDisplay:  UIButton!
  @IBOutlet weak var upButtonDisplay:    UIButton!
  @IBOutlet weak var rightButtonDisplay: UIButton!
  @IBOutlet weak var startButton:        UIButton!
  @IBOutlet weak var sScoreLabel:        UILabel!
  @IBOutlet weak var sHead:              UIImageView!
  @IBOutlet weak var sHead1:             UIImageView!
  @IBOutlet weak var sHead2:             UIImageView!
  @IBOutlet weak var sHead3:             UIImageView!
  @IBOutlet weak var gameBackGround:     UIImageView!
  @IBOutlet weak var winLabel: UIButton!
  @IBOutlet weak var gameOverLabel: UIButton!
  
  //snake array
  var snake: [UIImageView] = [];
  //point
  var point          = 0;
  //location5
  var cgfloat        = CGFloat(20);
  //rect 
  var Rect           = UIView(frame: CGRectMake(20,20,520,280));
  var sFood          = UIImageView();
  let SNAKEWITH      = CGFloat(20);
  let SNAKEHEIGHT    = CGFloat(20);
  //timer
  var snakeTimer     = NSTimer();
  //direction of changing movement
  var dx             = CGFloat(20);
  var dy             = CGFloat(0);
  var checkDirection = false;
  var count = 1;
  

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
  
  func Pause(){
    dy = 0;
    dx = 0;
    print("Pause");
    
  }
  
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

  @IBAction func sGameStratingButton(sender: AnyObject){
    //startingButton has be hidden and snake move around
    if(startButton.hidden == false){
      startButton.hidden   = true;
      gameOverLabel.hidden = true;
      winLabel.hidden      = true;
  
      print("startButton is hidden");
      //animation loop for snake moving inside
      snakeTimer = NSTimer.scheduledTimerWithTimeInterval(0.3,
        target: self, selector: "snakeMoving", userInfo: nil, repeats: true);
      
      checkBoundary();
    }
  }
  
  @IBAction func gameOverAction(sender: AnyObject) {
    if(gameOverLabel.hidden == false){
      print("game over in")
      gameOverLabel.hidden = true;
      startButton.hidden   = true;
      winLabel.hidden      = true;
      RandomSnakeBody();
      //animation loop for snake moving inside
      snakeTimer = NSTimer.scheduledTimerWithTimeInterval(0.3,
        target: self, selector: "snakeMoving", userInfo: nil, repeats: true);
      
      checkBoundary();
      
    }
  }
  
  @IBAction func winAction(sender: AnyObject) {
    if(winLabel.hidden == false){
      winLabel.hidden      = true;
      startButton.hidden   = true;
      gameOverLabel.hidden = true;
      RandomSnakeBody();
      //animation loop for snake moving inside
      snakeTimer = NSTimer.scheduledTimerWithTimeInterval(0.3,
        target: self, selector: "snakeMoving", userInfo: nil, repeats: true);
      
      checkBoundary();
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
 
  func checkBoundary(){
      if(snake[0].frame.origin.x < Rect.frame.origin.x ||
        snake[0].frame.origin.x > Rect.frame.width){ reset(); }
      else if(snake[0].frame.origin.y < Rect.frame.origin.y ||
        snake[0].frame.origin.y > Rect.frame.height){ reset(); }
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
    var body = 0;
    
    checkBoundary();
    sHead.frame = CGRectMake(sX+dx, sY+dy, SNAKEWITH, SNAKEHEIGHT);

    for var i=264; i<snake.count; i++ {
      if(CGRectIntersectsRect(snake[0].frame, snake[i].frame)){
        print("game over");
        reset();
      }
    }
    
    if(CGRectIntersectsRect(snake[0].frame, sFood.frame)){
      
      print("The snake head has collision with food");
      body += 1;
      sFood.hidden = true;
      snake.append(sFood);
      snake[body].frame = CGRectMake(snake[body-1].frame.origin.x, snake[body-1].frame.origin.y, SNAKEWITH, SNAKEHEIGHT);
      snake[body].hidden = false;
      self.view.addSubview(snake[body]);
      point            += 10;
      
      RandomSnakeBody();
      scoreUpdate();
      //place the food in the grid
    }
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
    
    Rect.layer.borderWidth = 1.0;
    Rect.layer.borderColor = UIColor.blackColor().CGColor;
    
    //clear array
    if(!snake.isEmpty){
      snake.removeAll();
    }
    if(count == 1){
      gameOverLabel.hidden = true;
      sFood.hidden         = false;
      startButton.hidden   = false;
      winLabel.hidden      = true;
    }
    count                  = 2;
    point                  = 0;
    scoreUpdate();
    snake.append(sHead);

    self.view.addSubview(gameBackGround);
    self.view.addSubview(Rect);
    self.view.addSubview(sScoreLabel);
    self.view.addSubview(winLabel);
    self.view.addSubview(gameOverLabel);
    self.view.addSubview(startButton);
    self.view.addSubview(sFood);
    self.view.addSubview(snake[0]);
    RandomSnakeBody();
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
    
    sFood.frame = CGRectMake(rX,rY,SNAKEWITH,SNAKEHEIGHT);
    sFood.layer.backgroundColor = UIColor.greenColor().CGColor;
    sFood.hidden = false;
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
    dx = 20;
    dy = 0;
    gameOverLabel.hidden = false;
    snakeTimer.invalidate();
    viewDidLoad();
  }
  

}