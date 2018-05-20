package by.gvozdev.achater.repos;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import by.gvozdev.achater.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByActivationCode(String code);
}
