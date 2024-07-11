package user.infrastructure.in;

import java.util.InputMismatchException;
import java.util.Scanner;

public class UserMain implements IMenu{
  @Override
  public int start() {
    while (true) {
      System.out.println("1. Create user");
      System.out.println("2. Find user");
      System.out.println("3. Delete user");
      System.out.print("[-] ");

      try (Scanner scanner = new Scanner(System.in)) {
        int option = scanner.nextInt();
        scanner.nextLine(); // Skip whitespace
        
        if (option > 0 && option < 4) {
          return option;
        } else {
          System.out.println("Invalid option. Please choose a number between 1 and 3.");
          continue;
        }

      } catch (InputMismatchException e) {
        System.out.println("Invalid option. Please try again.");
        continue;
      }
      

    }    
  }
}
