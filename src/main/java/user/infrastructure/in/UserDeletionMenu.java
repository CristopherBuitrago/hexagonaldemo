package user.infrastructure.in;

import java.util.InputMismatchException;
import java.util.Scanner;

import user.application.DeleteUserUseCase;

public class UserDeletionMenu implements IDeletionMenu{
    private DeleteUserUseCase deleteUserUseCase;

    public UserDeletionMenu(DeleteUserUseCase deleteUserUseCase) {
        this.deleteUserUseCase = deleteUserUseCase;
    }

    @Override
    public void start() {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("Enter user ID to delete:");
            int id = scanner.nextInt();
            scanner.nextLine(); // clean the buffer
            boolean isDeleted = deleteUserUseCase.execute(id);
            
            if (isDeleted) {
                System.out.println("User deleted successfully!");
            } else {
                System.out.println("User not found.");
            }

        } catch (InputMismatchException e) {
            e.printStackTrace();
            System.out.println("Only numbers are available");
        }
        
    }
}
