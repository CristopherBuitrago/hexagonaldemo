package application;

import domain.service.UserService;

public class FindUserUseCase {
  private final UserService userService;

  public FindUserUseCase(UserService userService) {
    this.userService = userService;
  }

  public void execute(int id) {
    userService.findUserById(id);
  }
}
