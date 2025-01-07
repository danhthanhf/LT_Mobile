package com.dreamchasers.recoverbe.entity.chat;

import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.helper.Model.BaseModel;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Entity
@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
public class Message extends BaseModel {
    @Column(columnDefinition = "TEXT")
    private String content;
    private String fileName;
    private String fileUrl;
    private String fileType;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JsonIgnore
    private Chat chat;

    @ManyToOne
    private User sender;
}
