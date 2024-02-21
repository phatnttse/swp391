/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

/**
 *
 * @author Dell
 */
public class CategoryDTO {
    private int categoryId;
    private String name;
    private int count;
    private String thumbnail;

    public CategoryDTO(int categoryId, String name, int count, String thumbnail) {
        this.categoryId = categoryId;
        this.name  = name;
        this.count = count;
        this.thumbnail = thumbnail;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public CategoryDTO(int categoryId, String name, String thumbnail) {
        this.categoryId = categoryId;
        this.name = name;
        this.thumbnail = thumbnail;
    }
    
    

    public CategoryDTO(int categoryId, String name, int count) {
        this.categoryId = categoryId;
        this.name = name;
        this.count = count;
    }

    public CategoryDTO(int categoryId, String name) {
        this.categoryId = categoryId;
        this.name = name;
    }

    public CategoryDTO() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return name;
    }

    public void setTitle(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    
}
