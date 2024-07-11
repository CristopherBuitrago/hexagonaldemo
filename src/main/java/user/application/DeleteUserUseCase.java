package user.application;

import user.domain.service.DeleteUserService;

public class DeleteUserUseCase {
    private final DeleteUserService deleteUserService;
    
    public DeleteUserUseCase(DeleteUserService deleteUserService) {
        this.deleteUserService = deleteUserService;
    }

    public boolean execute(int id) {
        return deleteUserService.deleteUser(id);
    }
}
