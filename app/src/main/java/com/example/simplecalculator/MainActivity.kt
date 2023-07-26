package com.example.simplecalculator

import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.activity.ComponentActivity
import kotlinx.android.synthetic.main.activity_main.btn0
import kotlinx.android.synthetic.main.activity_main.btn1
import kotlinx.android.synthetic.main.activity_main.btn2
import kotlinx.android.synthetic.main.activity_main.btn3
import kotlinx.android.synthetic.main.activity_main.btn4
import kotlinx.android.synthetic.main.activity_main.btn5
import kotlinx.android.synthetic.main.activity_main.btn6
import kotlinx.android.synthetic.main.activity_main.btn7
import kotlinx.android.synthetic.main.activity_main.btn8
import kotlinx.android.synthetic.main.activity_main.btn9
import kotlinx.android.synthetic.main.activity_main.btnBackspace
import kotlinx.android.synthetic.main.activity_main.btnCalculate
import kotlinx.android.synthetic.main.activity_main.btnClear
import kotlinx.android.synthetic.main.activity_main.btnDivide
import kotlinx.android.synthetic.main.activity_main.btnDot
import kotlinx.android.synthetic.main.activity_main.btnMinus
import kotlinx.android.synthetic.main.activity_main.btnMultiple
import kotlinx.android.synthetic.main.activity_main.btnSum
import kotlinx.android.synthetic.main.activity_main.resultText


class MainActivity : ComponentActivity() {
    private val operators: Array<String> = arrayOf("+", "-", "x", "/")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        initializeListeners()
    }

    private fun initializeListeners() {
        val btns: Array<Button> = arrayOf(
            btn1,
            btn2,
            btn3,
            btn4,
            btn5,
            btn6,
            btn7,
            btn8,
            btn9,
            btn0,
            btnSum,
            btnMinus,
            btnMultiple,
            btnDivide,
            btnDot
        )

        for (button in btns) {
            button.setOnClickListener {
                resultText.text = "${resultText.text}${button.text}"
            }
        }

        btnClear.setOnClickListener {
            resultText.text = ""
        }

        btnBackspace.setOnClickListener {
            resultText.text = resultText.text.dropLast(1)
        }

        btnCalculate.setOnClickListener {
            resultText.text = calculate(resultText.text.toString())
        }
    }

    private fun calculate(input: String): String {
        var result = ""
        try {
            var first = ""
            var second = ""
            var operator: String? = null

            for (i in input.indices) {
                Log.d("MD", i.toString())
                if (operators.contains(input[i].toString())) {
                    operator = input[i].toString()
                } else if (operator == null) {
                    first += input[i]
                } else {
                    second += input[i]
                }
            }
            if (operator == null) {
                result = first
            } else {
                when (operator) {
                    "+" -> {
                        result = (first.toDouble() + second.toDouble()).toString()
                    }

                    "-" -> {
                        result = (first.toDouble() - second.toDouble()).toString()
                    }

                    "x" -> {
                        result = (first.toDouble() * second.toDouble()).toString()
                    }

                    "/" -> {
                        result = (first.toDouble() / second.toDouble()).toString()
                    }
                }
            }

        } catch (e: Exception) {
            result = "Not valid"
        }
        return result
    }
}
