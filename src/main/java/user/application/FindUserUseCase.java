package user.application;

import user.domain.entity.User;
import user.domain.service.FindUserService;

public class FindUserUseCase {
  private FindUserService findUserService;

  public FindUserUseCase(FindUserService findUserService) {
    this.findUserService = findUserService;
  }

  public User execute(int id) {
    return findUserService.findUserById(id);
  } 
}
