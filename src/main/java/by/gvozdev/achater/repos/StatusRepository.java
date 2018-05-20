package by.gvozdev.achater.repos;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import by.gvozdev.achater.domain.StatusUser;
import org.springframework.data.jpa.repository.JpaRepository;


public interface StatusRepository extends JpaRepository<StatusUser, Long> {
    StatusUser findByIdUser(int userId);
}
