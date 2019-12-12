package demo.example.com.flutter_demo

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_second.*

class SecondActivity: AppCompatActivity() {
    private  val content by lazy { intent.getStringExtra(Key_content) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
//      val content=  intent.getStringExtra("flutter")
        mContent.text=content

    }

    companion object{
        private  const val  Key_content="content"

        fun newInstance(context: Activity,content: String){

              context.startActivity(Intent(context,SecondActivity::class.java).putExtra(Key_content,content))
        }

    }


}