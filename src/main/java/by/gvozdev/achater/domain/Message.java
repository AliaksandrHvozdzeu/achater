package by.gvozdev.achater.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Message to long")
    private String text;

    @NotBlank(message = "Please fill the tag")
    @Length(max = 255, message = "Tag to long")
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private Long dateon;
    private String filename;

    public Message() {
    }

    public Message(String text, String tag, Long dateon, User user) {
        this.author = user;
        this.text = text;
        this.tag = tag;
        this.dateon = dateon;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Long getDateon() {
        return dateon;
    }

    public void setDateon(Long dateon) {
        this.dateon = dateon;
    }


    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

}