package com.jms.respect.dto;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotNull;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 06/04/2016.
 */
public class AccountUpdateDto {
    @NotNull
    @Email
    private String email;

    @NotNull
    private Short refereeLevel;

    private Boolean remind;

    public AccountUpdateDto(String email, Short refereeLevel, Boolean remind) {
        this.email = email;
        this.refereeLevel = refereeLevel;
        this.remind = remind;
    }

    public AccountUpdateDto() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Short getRefereeLevel() {
        return refereeLevel;
    }

    public void setRefereeLevel(Short refereeLevel) {
        this.refereeLevel = refereeLevel;
    }

    public Boolean getRemind() {
        return remind;
    }

    public void setRemind(Boolean remind) {
        this.remind = remind;
    }
}
