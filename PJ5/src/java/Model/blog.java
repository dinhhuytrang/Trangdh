/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hello
 */
public class blog {
      private int postID;
    private String title;
    private String content;
    private String imageURL;
    private int postedByUserID;
    private String postDate;
    private String summarise;

    public blog() {
    }

    public String getSummarise() {
        return summarise;
    }

    public void setSummarise(String summarise) {
        this.summarise = summarise;
    }

    public blog(int postID, String title, String imageURL, String postDate, String summarise) {
        this.postID = postID;
        this.title = title;
        this.imageURL = imageURL;
        this.postDate = postDate;
        this.summarise = summarise;
    }

    public blog(int postID, String title, String content, String postDate) {
        this.postID = postID;
        this.title = title;
        this.content = content;
        this.postDate = postDate;
    }

    public blog(int postID, String title, String content, String imageURL, int postedByUserID, String postDate, String summarise) {
        this.postID = postID;
        this.title = title;
        this.content = content;
        this.imageURL = imageURL;
        this.postedByUserID = postedByUserID;
        this.postDate = postDate;
        this.summarise = summarise;
    }

    

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getPostedByUserID() {
        return postedByUserID;
    }

    public void setPostedByUserID(int postedByUserID) {
        this.postedByUserID = postedByUserID;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

   
}
