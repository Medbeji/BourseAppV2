//
//  DetailChartCell.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit
import Charts

class DetailChartCell: BaseCell {
    
    //    let barChart : BarChartView = {
    //        let bc = BarChartView(frame: CGRectZero)
    //        bc.noDataTextDescription = "GIVE REASON"
    //        return bc
    //    }()
    //    
    //    
    //    func setChart(dataPoints: [String], values: [Double]) {
    //        barChart.noDataText = "You need to provide data for the chart."
    //        
    //        var dataEntries: [BarChartDataEntry] = []
    //        
    //        for i in 0..<dataPoints.count {
    //            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
    //            dataEntries.append(dataEntry)
    //        }
    //        
    //        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
    //        let chartData = BarChartData(xVals: dataPoints, dataSet: chartDataSet)
    //        barChart.data = chartData
    //        
    //    }
    
    
    let lineChartView : LineChartView = {
        let lc = LineChartView(frame: CGRectZero)
        return lc
        
    }()
    
    
    
    
    func setChartData(months : [String], dollars1 : [Double] ) {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals1.append(ChartDataEntry(value: dollars1[i], xIndex: i))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First Set")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.redColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: months, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        //5 - finally set our data
        self.lineChartView.data = data            
    }
    
    
    
    override func setupViews() {
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChartData(months, dollars1: unitsSold)
        
        addSubview(lineChartView)
        addConstraintsWithFormat("H:|[v0]|", views: lineChartView)
        addConstraintsWithFormat("V:|[v0]|", views: lineChartView)
        backgroundColor = UIColor.rgb(250, green: 250, blue: 250)
    }
}
