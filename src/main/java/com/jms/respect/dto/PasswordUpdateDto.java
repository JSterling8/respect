package com.jms.respect.dto;

import com.jms.respect.dto.validator.FieldMatch;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by anon on 06/04/2016.
 */
@FieldMatch.List({
        @FieldMatch(first = "password", second = "confirmPassword", message = "The password fields must match"),
})
public class PasswordUpdateDto {
    @NotNull
    @Size(min = 6, max = 100, message = "Password must be 6-100 characters long")
    private String password;

    @NotNull
    private String confirmPassword;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
