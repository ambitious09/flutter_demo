package demo.example.com.flutter_demo

import android.app.Activity
import android.content.Intent
import android.os.AsyncTask
import android.os.Bundle
import android.os.Looper
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.concurrent.Executors

class MainActivity : FlutterActivity() {
    var showText: String = ""
    var channel: String = "com.demo"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
//   Executors.newFixedThreadPool(1)
        Executors.newScheduledThreadPool(6)
        System.err.println("线程数量=" + Runtime.getRuntime().availableProcessors())
//    AsyncTask
        
        val intrnt = intent
        val action = intrnt?.action
        val type = intrnt?.type

        if (Intent.ACTION_SEND == action) {
            if ("text/plain" == type) {
                handleSendText(intent)
            }

        }

        MethodChannel(flutterView, channel).setMethodCallHandler { call, result ->
            Log.i("tag", "call.method=${call.method}")
            Log.i("tag", "arguments=${call.arguments}")
            Log.i("tag", "result=${result}")
            when (call.method) {
                "flutter" -> {
                    Log.i("tag", "跳转")
                    SecondActivity.newInstance(this, call.arguments.toString())
                }
                else -> {
                    Log.i("tag", "其他")
                }
            }


        }


    }

    private fun handleSendText(intent: Intent?) {
        showText = intent?.getStringExtra(Intent.EXTRA_TEXT) ?: ""
    }
}
