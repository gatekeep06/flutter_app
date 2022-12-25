package com.example.flutter_app


import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import com.example.flutter_app.classes.Constants
import com.example.flutter_app.classes.Item
import com.example.flutter_app.classes.ItemList
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val PATH = "samples.flutter_app.dev/item"

    val list: List<Item> = listOf(Constants.locItem, Constants.locItem2)

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PATH).setMethodCallHandler { call, result ->
            if (call.method == "getItemName") {
                val itemPart = list[call.argument("itemId")!!].name
                result.success(itemPart)
            };
            if (call.method == "getDescription") {
                val itemPart = Constants.locItem.description
                result.success(itemPart)
            };
            if (call.method == "getItemPrice") {
                val itemPart = Constants.locItem.price
                result.success(itemPart)
            };
            if (call.method == "getImagePath") {
                val itemPart = Constants.locItem.imagePath
                result.success(itemPart)
            };
            if (call.method == "getCatalogSize") {
                val catalogSize = 2
                result.success(catalogSize)
            };
            if (call.method == "searchItemsByName") {
                val resultList = mutableListOf<Int>()
                for (i in list) {
                    if (i.name.contains(call.argument<String>("searchString")!!)) {
                        resultList.add(list.indexOf(i))
                    }
                }
                result.success(resultList)
            }
            else {
                result.notImplemented()
            }
        }
    }
}