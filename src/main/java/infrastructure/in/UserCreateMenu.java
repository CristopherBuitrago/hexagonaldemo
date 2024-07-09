package infrastructure.in;

import java.util.Scanner;

import application.CreateUserUseCase;
import domain.entity.User;

public class UserCreateMenu {
  private CreateUserUseCase createUserUseCase;

    public UserCreateMenu(CreateUserUseCase createUserUseCase) {
        this.createUserUseCase = createUserUseCase;
    }

    public void start() {
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
        }

        System.out.println("User created successfully!");
    }
}
