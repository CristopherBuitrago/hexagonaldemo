package user.domain.service;

import user.domain.entity.User;

public interface UserFullService {
    User findUserById(int id);
    boolean deleteUser(int id);
    void createUser(User user);
}
