package user.infrastructure.out;

import user.domain.entity.User;
import user.domain.service.CreateUserService;
import user.domain.service.DeleteUserService;
import user.domain.service.FindUserService;
import user.domain.service.UserFullService;

public class UserRepository implements UserFullService {
    private CreateUserService createUserService;
    private DeleteUserService deleteUserService;
    private FindUserService findUserService;

    public UserRepository(CreateUserService createUserService, DeleteUserService deleteUserService,
            FindUserService findUserService) {
        this.createUserService = createUserService;
        this.deleteUserService = deleteUserService;
        this.findUserService = findUserService;
    }

    @Override
    public User findUserById(int id) {
        User user = findUserService.findUserById(id);
        return user;
    }

    @Override
    public boolean deleteUser(int id) {
        return deleteUserService.deleteUser(id);
    }

    @Override
    public void createUser(User user) {
        createUserService.createUser(user);
    }
}