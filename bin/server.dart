library chat_example_force;

import 'dart:io';
import 'package:force/force_serverside.dart';

void main() {

    var portEnv = Platform.environment['PORT'];
    var port = portEnv == null ? 8080 : int.parse(portEnv);
    var serveClient = portEnv == null ? true : false;
    
    // Create a force server
    ForceServer fs = new ForceServer(port: port, 
                                     clientFiles: '../build/web/',
                                     clientServe: serveClient);
    // Setup logger
    fs.setupConsoleLog();
     
    fs.on('count', (e, sendable) { 
      sendable.send('notifications', e.json);
    });
  
    fs.start();
}
