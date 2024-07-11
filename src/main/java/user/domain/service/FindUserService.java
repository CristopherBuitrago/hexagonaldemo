package user.domain.service;

import user.domain.entity.User;

public interface FindUserService {
    User findUserById(int id);
}
