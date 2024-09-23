package com.example.flutter_method_channel

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import androidx.annotation.NonNull

class MainActivity: FlutterActivity(){
    private val SHARE_CHANNEL = "method_channel_flutter"


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SHARE_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method.equals("multiplynumbers")) {

                val args = call.arguments as Map<String, Any>
                val a = args["num1"] as Int;
                val b = args["num2"] as Int;
                val multiply: Int = a * b;
                result.success(hashMapOf("Multiply" to multiply)
                );
            }else{
                result.notImplemented()
            }

        }
    }

}
