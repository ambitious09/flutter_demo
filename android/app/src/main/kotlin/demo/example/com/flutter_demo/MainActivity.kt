package demo.example.com.flutter_demo

import android.app.Activity
import android.os.AsyncTask
import android.os.Bundle
import android.os.Looper

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.concurrent.Executors

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
//   Executors.newFixedThreadPool(1)
//    Executors.newScheduledThreadPool(6)
    System.err.println("线程数量="+Runtime.getRuntime().availableProcessors())
//    AsyncTask

  }
}
