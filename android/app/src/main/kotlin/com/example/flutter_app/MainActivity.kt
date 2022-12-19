package com.example.flutter_app


import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import com.example.flutter_app.classes.Constants
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(){
    private val PATH ="samples.flutter_app.dev/item"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PATH).setMethodCallHandler {
                call, result ->
            if (call.method == "getItemName"){
                val itemPart = Constants.locItem.name
                result.success(itemPart)
            };
            if(call.method == "getDescription"){
                val itemPart = Constants.locItem.description
                result.success(itemPart)
            };
            if (call.method == "getItemPrice"){
                val itemPart = Constants.locItem.price
                result.success(itemPart)
            };
            if (call.method == "getImagePath"){
                val itemPart = Constants.locItem.imagePath
                result.success(itemPart)
            }; else {
                result.notImplemented()
            }
        }
    }
}