package by.gvozdev.achater.repos;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import by.gvozdev.achater.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);
    Message findById(long id);
    //Message findById(long id);
    void deleteById(long id);
}
