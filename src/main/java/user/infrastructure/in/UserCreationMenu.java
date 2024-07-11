package user.infrastructure.in;

import java.util.InputMismatchException;
import java.util.Scanner;

import user.application.CreateUserUseCase;
import user.domain.entity.User;

public class UserCreationMenu implements ICreationMenu {
  private CreateUserUseCase createUserUseCase;

    public UserCreationMenu(CreateUserUseCase createUserUseCase) {
        this.createUserUseCase = createUserUseCase;
    }

    @Override
    public void start() {
        while (true) {
            try (Scanner scanner = new Scanner(System.in)) {
                System.out.println("Enter username: ");
                String name = scanner.nextLine();
    
                System.out.println("Enter user email: ");
                String email = scanner.nextLine();
    
                System.out.println("Enter user password: ");
                String password = scanner.nextLine();
    
                System.out.println("Enter user role: ");
                int role = scanner.nextInt();
                scanner.nextLine();// clean buffer
    
                User user = new User();
                user.setUsername(name);
                user.setEmail(email);
                user.setPassword(password);
                user.setRole(role);
    
                createUserUseCase.execute(user);
            } catch (InputMismatchException e) {
                e.printStackTrace();
                System.out.println("Only numbers are valid");
                continue;
            }
    
            System.out.println("User created successfully!");
            return;
        }
    }
}
