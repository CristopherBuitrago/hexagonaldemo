package user.infrastructure.in;

import java.util.Scanner;

import user.application.FindUserUseCase;
import user.domain.entity.User;

public class UserFounderMenu implements IFounderMenu{
  private FindUserUseCase findUserUseCase;

  public UserFounderMenu(FindUserUseCase findUserUseCase) {
    this.findUserUseCase = findUserUseCase;
  }

  public void start() {
    try (Scanner scanner = new Scanner(System.in)) {
      System.out.println("Enter ID: ");
      int id = scanner.nextInt();
      scanner.nextLine(); // clean the buffer

      // use use case to find user by id
      User user = findUserUseCase.execute(id);

      // verify if user is null
      if (user == null) {
        System.out.println("User not found!");
        return;
      }

      // left format
      String LeftAlignFormat = "| %-4d | %-40s | %-40s | %-4d |%n";

      // how to show
      System.out.format("+------+------------------------------------------+------------------------------------------+------+%n");
      System.out.format("| ID   | Username                                 | Email                                    | Role |%n");
      System.out.format("+------+------------------------------------------+------------------------------------------+------+%n");
      
      // input the values to format
      System.out.format(LeftAlignFormat, user.getUsername(), user.getEmail(), user.getRole());

      // draw the end of the page
      System.out.format("+------+------------------------------------------+------------------------------------------+------+%n");

    }
  }
}
