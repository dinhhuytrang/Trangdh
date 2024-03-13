/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hello
 */
public class comment {
     private int commentID;
    private String commentText;
    private int postID;
    private int commentByUserID;
    private String commentDate;

    public comment() {
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getCommentByUserID() {
        return commentByUserID;
    }

    public void setCommentByUserID(int commentByUserID) {
        this.commentByUserID = commentByUserID;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

    public comment(int commentID, String commentText, int postID, int commentByUserID, String commentDate) {
        this.commentID = commentID;
        this.commentText = commentText;
        this.postID = postID;
        this.commentByUserID = commentByUserID;
        this.commentDate = commentDate;
    }
    
}
