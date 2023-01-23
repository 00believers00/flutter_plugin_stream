//
//  CounterStream.swift
//  plugin_stream
//
//  Created by ap on 24/1/2566 BE.
//

import UIKit
import Flutter

class CounterStream: NSObject{
    private var counter:Int = 0
    private var sink: FlutterEventSink?
    private var timer: Timer?
}

extension CounterStream:FlutterStreamHandler{
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        
        self.sink = events
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            events(self.counter)
            self.counter += 1
        })
        
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        sink = nil
        timer?.invalidate()
        return nil
    }
    
}
