/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author Desktop
 */
public class News {

    private int newsId;
    private String newsTitle;

    private String newsImageDescription;
    private String newsContent;
    private LocalDate datePosted;

    public News() {
    }

    public News(int newsId, String newsTitle, String newsImageDescription, String newsContent) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.newsImageDescription = newsImageDescription;
        this.newsContent = newsContent;
        this.datePosted = LocalDate.now();
    }
    
    public News(String newsTitle, String newsImageDescription, String newsContent) {
        this.newsTitle = newsTitle;
        this.newsImageDescription = newsImageDescription;
        this.newsContent = newsContent;
        this.datePosted = LocalDate.now();
    }

    
    
    
    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsImageDescription() {
        return newsImageDescription;
    }

    public void setNewsImageDescription(String newsImageDescription) {
        this.newsImageDescription = newsImageDescription;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public LocalDate getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(LocalDate datePosted) {
        this.datePosted = datePosted;
    }

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", newsTitle=" + newsTitle + ", newsImageDescription=" + newsImageDescription + ", newsContent=" + newsContent + ", datePosted=" + datePosted + '}';
    }
    
    
    
    
}
