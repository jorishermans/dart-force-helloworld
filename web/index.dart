import 'dart:async';
import 'dart:html';

import 'package:force/force_browser.dart';

void main() {
  ForceClient forceClient = new ForceClient();
  forceClient.connect();
  
  int count = 0;
  
  AnchorElement element = querySelector("#foo");
  element.onClick.listen((e) {
    count++;
    forceClient.send('count', {"count" : count, "foo" : "hello"} );
  });
  
  forceClient.on("notifications", (e, sender) {
    var json = e.json;
    print("received $json");
  });
}
