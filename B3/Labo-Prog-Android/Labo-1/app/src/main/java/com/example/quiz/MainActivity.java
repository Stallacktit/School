package com.example.quiz;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import quiz.models.Question;
public class MainActivity extends AppCompatActivity {
    private Button mTrueButton;
    private Button mFalseButton;
    private Button mNextButton;
    private TextView mQuestionTextView;
    private int mCurrentIndex = 0;
    private Question[] mQuestionBank = new Question[]{
            new Question(R.string.question_australia,true),
            new Question(R.string.question_oceans,true),
            new Question(R.string.question_mideast,false),
    };
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mTrueButton=findViewById(R.id.true_button);
        mFalseButton=findViewById(R.id.false_button);
        mNextButton=findViewById(R.id.next_button);
        mQuestionTextView=findViewById(R.id.question_text_view);
        spawnQuestion();
        mTrueButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                verifAnswer(true);
            }
        });
        mFalseButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                verifAnswer(false);
            }
        });
        mNextButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mCurrentIndex=mCurrentIndex+1;
                if (mCurrentIndex==mQuestionBank.length)
                {
                    mCurrentIndex=0;
                }
                spawnQuestion();
            }
        });
    }
    public void spawnQuestion(){
        mQuestionTextView.setText(mQuestionBank[mCurrentIndex].getTextResId());
    }
    public void verifAnswer(boolean goodAnswer){
        if (mQuestionBank[mCurrentIndex].isAnswerTrue()==goodAnswer){
            Toast.makeText(MainActivity.this,R.string.goodAnswer, Toast.LENGTH_SHORT).show();
            }
        else {
            Toast.makeText(MainActivity.this, R.string.badAnswer, Toast.LENGTH_SHORT).show();
        }
    }
}