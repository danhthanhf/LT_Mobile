package com.dreamchasers.recoverbe.entity.chat;

import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.helper.Model.BaseModel;
import jakarta.persistence.CascadeType;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Entity
@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
public class UserChat extends BaseModel {
    @ManyToOne (cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    private User user;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    private Chat chat;

    private boolean isRead;
    private boolean blocked;
    private boolean deleted;

    public UserChat(User user, boolean b) {
        this.user = user;
        this.isRead = b;
    }
}
