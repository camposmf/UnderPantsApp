package com.example.bolsointeligente

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.animation.Animation
import android.view.animation.LinearInterpolator
import android.view.animation.RotateAnimation
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.example.bolsointeligente.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)

        window.statusBarColor = ContextCompat.getColor(this, R.color.white)


        Handler().postDelayed({
            irTelaApresentacao()
        }, 2000)
        setContentView(binding.root)
    }

    private fun irTelaApresentacao() {
        val intent = Intent(this, ApresentacaoActivity::class.java)
        startActivity(intent)
        finish()
    }
}