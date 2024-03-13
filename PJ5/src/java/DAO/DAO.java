/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.DBContext;
import Model.blog;
import Model.comment;
import Model.user;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author hello
 */
public class DAO extends DBContext {

    PreparedStatement ptsm;
    ResultSet rs;

    public user login(String username, String password) {
        String query = "SELECT [UserID], [Username], [UserRole] FROM [Users] WHERE [Username] = ? AND [Password] = ?";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                int userId = resultSet.getInt("UserID");
                int userRole = resultSet.getInt("UserRole");

                return new user(userId, username, password, userRole);
            }
        } catch (Exception e) {
            System.out.println("Login" + e.getMessage());
        }

        return null;
    }
  public ArrayList<blog> getNewestBlogPosts(int count) {
    ArrayList<blog> blogPosts = new ArrayList<>();

    try {
       String sqlQuery = "SELECT TOP (?) PostID, Title, Summary, ImageURL, PostDate FROM BlogPosts " +
                 "ORDER BY PostID DESC";

        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setInt(1, count); // Set the number of posts you want to retrieve

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            int postID = resultSet.getInt("PostID");
            String title = resultSet.getString("Title");
            String summary = resultSet.getString("Summary");
            String imageURL = resultSet.getString("ImageURL");
            String postDate = resultSet.getString("PostDate");
            blog blogPost = new blog(postID, title, imageURL, postDate, summary);
            blogPosts.add(blogPost);
        }

        preparedStatement.close();
    } catch (Exception e) {
        System.out.println("getNewestBlogPosts: " + e.getMessage());
    }

    return blogPosts;
  }
    public void register(user u) {
        String insertQuery = "INSERT INTO [Users] ([Username], [Password], [UserRole]) VALUES (?, ?, ?)";

        try ( PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getPasword());
            pstmt.setString(3, "0");

            pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("Register" + e.getMessage());

        }
    }

    public boolean checkexitst(String username) {
        String query = "SELECT [UserID], [Username], [UserRole] FROM [Users] WHERE [Username] = ? ";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);

            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Login" + e.getMessage());
        }

        return false;
    }

    public int countCommentsForPost(int postID) {
        int commentCount = 0;

        try {
            String sqlQuery = "SELECT COUNT(*) FROM Comments WHERE PostID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, postID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                commentCount = resultSet.getInt(1);
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("countCommentsForPost: " + e.getMessage());
        }

        return commentCount;
    }

    public ArrayList<comment> getCommentsForPost(int postID) {
        ArrayList<comment> comments = new ArrayList<>();

        try {
            String sqlQuery = "SELECT CommentID, CommentText, PostID, CommentByUserID, CommentDate FROM Comments WHERE PostID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, postID);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int commentID = resultSet.getInt("CommentID");
                String commentText = resultSet.getString("CommentText");
                int commentPostID = resultSet.getInt("PostID");
                int commentByUserID = resultSet.getInt("CommentByUserID");
                String commentDate = resultSet.getString("CommentDate");
                comment comment = new comment(commentID, commentText, commentPostID, commentByUserID, commentDate);
                comments.add(comment);
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("getCommentsForPost: " + e.getMessage());
        }

        return comments;
    }
    public ArrayList<blog> getBlogPostsByContent(String contentToSearch) {
    ArrayList<blog> blogPosts = new ArrayList<>();

    try {
        String sqlQuery = "SELECT PostID, Title, Summary, ImageURL, PostDate FROM BlogPosts WHERE Title LIKE ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setString(1, "%" + contentToSearch + "%"); // Use the LIKE operator to search for content

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            int postID = resultSet.getInt("PostID");
            String title = resultSet.getString("Title");
            String summary = resultSet.getString("Summary");
            String imageURL = resultSet.getString("ImageURL");
            String postDate = resultSet.getString("PostDate");
            blog blogPost = new blog(postID, title, imageURL, postDate, summary);
            blogPosts.add(blogPost);
        }

        preparedStatement.close();
    } catch (Exception e) {
        System.out.println("getBlogPostsByContent: " + e.getMessage());
    }

    return blogPosts;
}


    public void deleteCommentByDatePostIDUserID( String CommentID) {
        try {
            String sqlQuery = "DELETE FROM Comments WHERE CommentID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, CommentID);
            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Comment deleted successfully.");
            } else {
                System.out.println("No matching comments found for deletion.");
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("deleteCommentByDatePostIDUserID: " + e.getMessage());
        }
    }

    public void insertComment(int postID, int commentByUserID, String commentText, String commentDate) {
        try {
            String sqlQuery = "INSERT INTO Comments (PostID, CommentByUserID, CommentText, CommentDate) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, postID);
            preparedStatement.setInt(2, commentByUserID);
            preparedStatement.setString(3, commentText);
            preparedStatement.setString(4, commentDate);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Comment inserted successfully.");
            } else {
                System.out.println("Comment insertion failed.");
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("insertComment: " + e.getMessage());
        }
    }

    public ArrayList<blog> getAllBlogPosts() {
        ArrayList<blog> blogPosts = new ArrayList<>();

        try {
            String sqlQuery = "SELECT PostID, Title, Summary, ImageURL, PostDate FROM BlogPosts";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int postID = resultSet.getInt("PostID");
                String title = resultSet.getString("Title");
                String summary = resultSet.getString("Summary");
                String imageURL = resultSet.getString("ImageURL");
                String postDate = resultSet.getString("PostDate");
                blog blogPost = new blog(postID, title, imageURL, postDate, summary);
                blogPosts.add(blogPost);
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("getAllBlogPosts: " + e.getMessage());

        }

        return blogPosts;
    }
public blog getBlogPostByID(int postID) {
    blog blogPost = null;

    try {
        String sqlQuery = "SELECT * from [BlogPosts] WHERE PostID = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
        preparedStatement.setInt(1, postID);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            String title = resultSet.getString("Title");
            String content = resultSet.getString("Content");
            String postDate = resultSet.getString("PostDate");
            String summary = resultSet.getString("Summary");
            String img = resultSet.getString("ImageURL");
            blogPost = new blog(postID, title, content, img, postID, postDate, summary);
        }

        preparedStatement.close();
    } catch (Exception e) {
        System.out.println("getBlogPostByID: " + e.getMessage());
    }

    return blogPost;
}

    public void deleteBlogPost(int postID) {
        try {
            String deleteQuery = "DELETE FROM BlogPosts WHERE PostID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, postID);

            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Blog post with ID " + postID + " deleted successfully.");
            } else {
                System.out.println("No matching blog post found for deletion.");
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("deleteBlogPost: " + e.getMessage());
        }
    }

    public void updateBlogPost(int postID, String newTitle, String newContent, String newImageURL,String summary) {
        try {
            String updateQuery = "UPDATE BlogPosts SET Title = ?, Content = ?, ImageURL = ? , Summary = ? WHERE PostID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, newTitle);
            preparedStatement.setString(2, newContent);
            preparedStatement.setString(3, newImageURL);
            preparedStatement.setString(4, summary);
            preparedStatement.setInt(5, postID);

            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Blog post with ID " + postID + " updated successfully.");
            } else {
                System.out.println("No matching blog post found for update.");
            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("updateBlogPost: " + e.getMessage());
        }
    }

    public void addBlogPost(String title, String content, String imageURL, int postedByUserID,String Summary) {
        try {
            // Get the current date
            LocalDate postDate = LocalDate.now();

            String insertQuery = "INSERT INTO BlogPosts (Title, Content, ImageURL, PostedByUserID, PostDate,Summary) VALUES (?, ?, ?, ?, ? , ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, content);
            preparedStatement.setString(3, imageURL);
            preparedStatement.setInt(4, postedByUserID);
            preparedStatement.setString(5, postDate.toString());
            preparedStatement.setString(6, Summary);
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Blog post added successfully.");
            } else {
                System.out.println("Failed to add the blog post.");
            }

            preparedStatement.close();
        } catch (SQLException e) {
            System.out.println("addBlogPost: " + e.getMessage());
        }
    }

    public int generateid() {
        int commentCount = 0;

        try {
            String sqlQuery = "SELECT max([PostID])\n"
                    + "      \n"
                    + "  FROM [projectprj].[dbo].[BlogPosts]";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                commentCount = resultSet.getInt(1);

            }

            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("generateid: " + e.getMessage());
        }

        return commentCount + 1;
    }
    public user getUserById(int userId) {
    String query = "SELECT [Username], [UserRole] FROM [Users] WHERE [UserID] = ?";

    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setInt(1, userId);

        ResultSet resultSet = pstmt.executeQuery();
        if (resultSet.next()) {
            String username = resultSet.getString("Username");
            int userRole = resultSet.getInt("UserRole");

            return new user(userId, username, userRole);
        }
    } catch (Exception e) {
        System.out.println("getUserById: " + e.getMessage());
    }

    return null;
}

}
