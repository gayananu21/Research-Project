//
//  EEG_HOME_ViewController.swift
//  Café-Nibm
//
//  Created by Gayan Disanayaka on 8/19/21.
//  Copyright © 2021 Gayan Disanayaka. All rights reserved.
//

import UIKit
import Lottie
import CorePlot
import Firebase

class EEG_HOME_ViewController: UIViewController {

    @IBOutlet weak var btnScan: UIButton!
    @IBOutlet weak var lblAlpha: UILabel!
    @IBOutlet weak var lblBeta: UILabel!
    @IBOutlet weak var lblTheta: UILabel!
    
    @IBOutlet weak var eView: UIView!
    let lottieView = AnimationView()
    
    //CorePlot variables
    
    var plotData = [Double](repeating: 0.0, count: 1000)
    var plot: CPTScatterPlot!
    var plot2: CPTScatterPlot!
    var maxDataPoints = 100
    var frameRate = 5.0
    var alphaValue = 0.25
    var timer : Timer?
    var timer2 : Timer?
    var currentIndex: Int!
    var timeDuration:Double = 0.1
    public var m=0.0
 
    
   
    
    @IBOutlet weak var P_Label: UILabel!
    
    @IBOutlet weak var T_Label: UILabel!
    
  
    @IBOutlet weak var E_Label: UILabel!
    
    

    @IBOutlet weak var bpmText: UILabel!
    

    @IBOutlet weak var hostView: CPTGraphHostingView!
    
    @IBOutlet weak var hostViewTheta: CPTGraphHostingView!
    
 
  
    @IBOutlet weak var dataButton: UIView!
    

    @IBOutlet weak var xValue: UILabel!
    
    @IBOutlet weak var yValue: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnScan.layer.borderWidth = 0.5
        btnScan.layer.masksToBounds = false
        btnScan.layer.borderColor = UIColor.black.cgColor
        btnScan.layer.cornerRadius = btnScan.frame.height/2
        btnScan.clipsToBounds = true
        btnScan.alpha = 1
 
        lblAlpha.layer.borderWidth = 0.5
        lblAlpha.layer.masksToBounds = false
        lblAlpha.layer.borderColor = UIColor.black.cgColor
        lblAlpha.layer.cornerRadius = lblAlpha.frame.height/2
        lblAlpha.clipsToBounds = true
        lblAlpha.alpha = 1
 
        lblBeta.layer.borderWidth = 0.5
        lblBeta.layer.masksToBounds = false
        lblBeta.layer.borderColor = UIColor.black.cgColor
        lblBeta.layer.cornerRadius = lblBeta.frame.height/2
        lblBeta.clipsToBounds = true
        lblBeta.alpha = 1
 
        lblTheta.layer.borderWidth = 0.5
        lblTheta.layer.masksToBounds = false
        lblTheta.layer.borderColor = UIColor.black.cgColor
        lblTheta.layer.cornerRadius = lblTheta.frame.height/2
        lblTheta.clipsToBounds = true
        lblTheta.alpha = 1
        
        
        
        
        self.lottieView.alpha = 1
                                   self.lottieView.animation = Animation.named("Dog")
                                   //let lottieView = AnimationView(animation: loadingAnimation)
                                       // 2. SECOND STEP (Adding and setup):
        eView.addSubview(self.lottieView)
                                   self.lottieView.contentMode = .scaleAspectFit
                                   self.lottieView.loopMode = .autoReverse
                                   self.lottieView.play(toFrame: .infinity)
                                   
                                   
                                   
                                       // 3. THIRD STEP (LAYOUT PREFERENCES):
                                   self.lottieView.translatesAutoresizingMaskIntoConstraints = false
                                       NSLayoutConstraint.activate([
                                           self.lottieView.leftAnchor.constraint(equalTo: eView.leftAnchor),
                                           self.lottieView.rightAnchor.constraint(equalTo: eView.rightAnchor),
                                           self.lottieView.topAnchor.constraint(equalTo: eView.topAnchor),
                                           self.lottieView.bottomAnchor.constraint(equalTo: eView.bottomAnchor)
                                       ])
 
        
        
        var ref=Database.database().reference()
        var bpm=ref.child("Heart")
               
        var temp=ref.child("Temp")
        var pulse=ref.child("Pulse")
         
        
   
               bpm.observe(.value, with: {snapshot in
                   
                   self.m=(snapshot.value as?Double)!
                  
                   
               })
        
       
               
               super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        lblAlpha.addGestureRecognizer(tap)
        
        let tapT = UITapGestureRecognizer(target: self, action: #selector(self.handleTapTheta(_:)))
        lblTheta.addGestureRecognizer(tapT)
        
        let tapB = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBeta(_:)))
        lblBeta.addGestureRecognizer(tapB)
        
        
              
       
        initPlot()
        
 
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil){
        
    
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                          let VC1 = storyBoard.instantiateViewController(withIdentifier: "alphaView") as! AlphaViewController
                    
               
               self.navigationController?.pushViewController(VC1, animated: true)
    }
    
    @objc func handleTapTheta(_ sender: UITapGestureRecognizer? = nil){
        
      
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                          let VC1 = storyBoard.instantiateViewController(withIdentifier: "thetaView") as! ThetaViewController
                    
               
               self.navigationController?.pushViewController(VC1, animated: true)
    }
    
    @objc func handleTapBeta(_ sender: UITapGestureRecognizer? = nil){
        

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                          let VC1 = storyBoard.instantiateViewController(withIdentifier: "betaView") as! BetaViewController
                    
               
               self.navigationController?.pushViewController(VC1, animated: true)
    }
    
    
    func initPlot(){
        configureGraphtView()
        
        configureGraphAxis()
        configurePlot()
        
       
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: self.timeDuration, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
       
        
    }
    
    
    
    @objc func fireTimer(){
        let graph = self.hostView.hostedGraph
        let plot = graph?.plot(withIdentifier: "mindful-graph" as NSCopying)
        if((plot) != nil){
            if(self.plotData.count >= maxDataPoints){
                self.plotData.removeFirst()
                plot?.deleteData(inIndexRange:NSRange(location: 0, length: 1))
            }
        }
        guard let plotSpace = graph?.defaultPlotSpace as? CPTXYPlotSpace else { return }
        
        let location: NSInteger
        if self.currentIndex >= maxDataPoints {
            location = self.currentIndex - maxDataPoints + 2
        } else {
            location = 0
        }
        
        let range: NSInteger
        
        if location > 0 {
            range = location-1
        } else {
            range = 0
        }
        
        let oldRange =  CPTPlotRange(locationDecimal: CPTDecimalFromDouble(Double(range)), lengthDecimal: CPTDecimalFromDouble(Double(maxDataPoints-2)))
        let newRange =  CPTPlotRange(locationDecimal: CPTDecimalFromDouble(Double(location)), lengthDecimal: CPTDecimalFromDouble(Double(maxDataPoints-2)))
    
        CPTAnimation.animate(plotSpace, property: "xRange", from: oldRange, to: newRange, duration:0.3)
        
        self.currentIndex += 1;
        let point = m
        self.plotData.append(point)
        
        if(m>90){
            //xValue.backgroundColor=UIColor .red
        }
        plot?.insertData(at: UInt(self.plotData.count-1), numberOfRecords: 1)
    }
    
    func configureGraphtView(){
        hostView.allowPinchScaling = false
        self.plotData.removeAll()
        self.currentIndex = 0
    }
    
    func configureGraphAxis(){
        
        let graph = CPTXYGraph(frame: hostView.bounds)
        graph.plotAreaFrame?.masksToBorder = false
        hostView.hostedGraph = graph
        graph.backgroundColor = UIColor.black.cgColor
        graph.paddingBottom = 40.0
        graph.paddingLeft = 40.0
        graph.paddingTop = 30.0
        graph.paddingRight = 15.0
        

        //Set title for graph
        let titleStyle = CPTMutableTextStyle()
        titleStyle.color = CPTColor.white()
        titleStyle.fontName = "HelveticaNeue-Bold"
        titleStyle.fontSize = 20.0
        titleStyle.textAlignment = .center
        graph.titleTextStyle = titleStyle

        
        
        let axisSet = graph.axisSet as! CPTXYAxisSet
        
        let axisTextStyle = CPTMutableTextStyle()
        axisTextStyle.color = CPTColor.white()
        axisTextStyle.fontName = "HelveticaNeue-Bold"
        axisTextStyle.fontSize = 10.0
        axisTextStyle.textAlignment = .center
        let lineStyle = CPTMutableLineStyle()
        lineStyle.lineColor = CPTColor.white()
        lineStyle.lineWidth = 5
        let gridLineStyle = CPTMutableLineStyle()
        gridLineStyle.lineColor = CPTColor.gray()
        gridLineStyle.lineWidth = 0.5
       

        if let x = axisSet.xAxis {
            x.majorIntervalLength   = 20
            x.minorTicksPerInterval = 5
            x.labelTextStyle = axisTextStyle
            x.minorGridLineStyle = gridLineStyle
            x.axisLineStyle = lineStyle
            x.axisConstraints = CPTConstraints(lowerOffset: 0.0)
            x.delegate = self
        }

        if let y = axisSet.yAxis {
            y.majorIntervalLength   = 10
            y.minorTicksPerInterval = 10
            y.minorGridLineStyle = gridLineStyle
            y.labelTextStyle = axisTextStyle
            y.alternatingBandFills = [CPTFill(color: CPTColor.init(componentRed: 255, green: 255, blue: 255, alpha: 0.03)),CPTFill(color: CPTColor.black())]
            y.axisLineStyle = lineStyle
            y.axisConstraints = CPTConstraints(lowerOffset: 0.0)
            y.delegate = self
        }

        // Set plot space
        let xMin = 0.0
        let xMax = 100.0
     let yMin = 40.0
     let yMax = 130.0
        guard let plotSpace = graph.defaultPlotSpace as? CPTXYPlotSpace else { return }
        plotSpace.xRange = CPTPlotRange(locationDecimal: CPTDecimalFromDouble(xMin), lengthDecimal: CPTDecimalFromDouble(xMax - xMin))
        plotSpace.yRange = CPTPlotRange(locationDecimal: CPTDecimalFromDouble(yMin), lengthDecimal: CPTDecimalFromDouble(yMax - yMin))
        
    }
    
    func configurePlot(){
        plot = CPTScatterPlot()
        let plotLineStile = CPTMutableLineStyle()
        plotLineStile.lineJoin = .round
        plotLineStile.lineCap = .round
        plotLineStile.lineWidth = 2
        
    
        plotLineStile.lineColor = CPTColor.white()
        
        plot.dataLineStyle = plotLineStile
        plot.curvedInterpolationOption = .catmullCustomAlpha
        plot.interpolation = .curved
        plot.identifier = "mindful-graph" as NSCoding & NSCopying & NSObjectProtocol
        guard let graph = hostView.hostedGraph else { return }
        plot.dataSource = (self as CPTPlotDataSource)
        plot.delegate = (self as CALayerDelegate)
        graph.add(plot, to: graph.defaultPlotSpace)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func onAutomation(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AUTOMATION_TAB")
         vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
}

extension EEG_HOME_ViewController: CPTScatterPlotDataSource, CPTScatterPlotDelegate {
    func numberOfRecords(for plot: CPTPlot) -> UInt {
        return UInt(self.plotData.count)
    }

    func scatterPlot(_ plot: CPTScatterPlot, plotSymbolWasSelectedAtRecord idx: UInt, with event: UIEvent) {
    }

     func number(for plot: CPTPlot, field: UInt, record: UInt) -> Any? {
        
       switch CPTScatterPlotField(rawValue: Int(field))! {
        
            case .X:
                return NSNumber(value: Int(record) + self.currentIndex-self.plotData.count)

            case .Y:
                return self.plotData[Int(record)] as NSNumber
            
            default:
                return 0
        
        }
        
    }
}
