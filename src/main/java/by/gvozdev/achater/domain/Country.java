package by.gvozdev.achater.domain;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String countryName;
    private String fileFlage;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getFileFlage() {
        return fileFlage;
    }

    public void setFileFlage(String fileFlage) {
        this.fileFlage = fileFlage;
    }
}
