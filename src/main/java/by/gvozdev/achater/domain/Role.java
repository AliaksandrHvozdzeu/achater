package by.gvozdev.achater.domain;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
