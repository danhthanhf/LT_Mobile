package com.dreamchasers.recoverbe.entity.post;

import com.dreamchasers.recoverbe.helper.Model.BaseModel;
import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Entity
@Getter
@Setter
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
public class Tag extends BaseModel {
    private String name;
    private int totalPost = 1;
}
