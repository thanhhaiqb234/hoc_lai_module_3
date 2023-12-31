package model;

public class Book {
    private int id;
    private String title;
    private int pagesize;
    private String author;
    private int category;
    private int status;

    public Book() {
    }

    public Book(int id, String title, int pagesize, String author, int category, int status) {
        this.id = id;
        this.title = title;
        this.pagesize = pagesize;
        this.author = author;
        this.category = category;
        this.status = status;
    }

    public Book(int id, String title, int pagesize, String author, int category) {
        this.id = id;
        this.title = title;
        this.pagesize = pagesize;
        this.author = author;
        this.category = category;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
