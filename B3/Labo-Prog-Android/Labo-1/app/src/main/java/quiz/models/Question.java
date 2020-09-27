package quiz.models;

public class Question {

    private int mTextResId;
    private boolean mAnswerTrue;

    public Question(int mTextResId, boolean mAnswerTrue) {
        this.mTextResId = mTextResId;
        this.mAnswerTrue = mAnswerTrue;
    }
    public void setTextResId(int mTextResId) {
        this.mTextResId = mTextResId;
    }
    public int getTextResId() {
        return mTextResId;
    }
    public void setAnswerTrue(boolean mAnswerTrue){
        this.mAnswerTrue = mAnswerTrue;
    }
    public boolean isAnswerTrue(){
        return mAnswerTrue;
    }
}
