package user.application;

import user.domain.entity.User;
import user.domain.service.CreateUserService;

public class CreateUserUseCase {
    private final CreateUserService createUserService;

    public CreateUserUseCase(CreateUserService createUserService) {
        this.createUserService = createUserService;
    }

    public void execute(User user) {
        createUserService.createUser(user);
    }
}