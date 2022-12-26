package com.example.flutter_app


import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.*

class MainActivity : FlutterActivity() {
    private val PATH = "samples.flutter_app.dev/item"
    val favorites_file = File("favorites.data")
    val cart_file = File("cart.data")

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PATH).setMethodCallHandler { call, result ->
        }
    }
}