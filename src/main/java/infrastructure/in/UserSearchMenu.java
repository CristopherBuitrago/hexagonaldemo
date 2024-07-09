package infrastructure.in;

import java.util.Scanner;

import application.FindUserUseCase;

public class UserSearchMenu {
  private FindUserUseCase findUserUseCase;

  public UserSearchMenu(FindUserUseCase findUserUseCase) {
    this.findUserUseCase = findUserUseCase;
  }

  public void start() {
    try (Scanner scanner = new Scanner(System.in)) {
      System.out.println("Enter ID: ");
      int id = scanner.nextInt();
      scanner.nextLine(); // clean the buffer

      findUserUseCase.execute(id);
    }

    System.out.println("User found successfully!");
  }
}
