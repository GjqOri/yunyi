package cn.chen.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Question {
    private int id;
    @NotNull(message = "问题标题必须填")
    @Size(min = 4, max = 30, message = "标题长度需在4到30之间")
    private String questionName;
    private User questioner;
    @NotNull(message = "问题内容必须填")
    private String questionContent;
    private String creationTime;
    private int likenum;
    private int commentNum;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public User getQuestioner() {
        return questioner;
    }

    public void setQuestioner(User questioner) {
        this.questioner = questioner;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }

    public int getLikenum() {
        return likenum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public int getCommentNum() {
        return commentNum;
    }
}
