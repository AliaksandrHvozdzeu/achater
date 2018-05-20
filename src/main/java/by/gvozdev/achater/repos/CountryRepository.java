package by.gvozdev.achater.repos;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import by.gvozdev.achater.domain.Country;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CountryRepository extends CrudRepository<Country, Long> {
    List<Country> findAll();
}
