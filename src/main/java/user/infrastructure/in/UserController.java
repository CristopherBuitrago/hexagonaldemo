package user.infrastructure.in;

public class UserController implements IController{
    // attributes
    private IMenu menu;
    private ICreationMenu creation;
    private IFounderMenu founder;
    private IDeletionMenu delete;

    // constructor
    public UserController() {
        this.menu = new UserMain();
        this.creation = new UserCreationMenu(null);
    }

    @Override
    public void run() {
        while (true) {
            try {
                int option = menu.start();

                switch (option) {
                    case 1:
                        creation.start();
                        break;
                    case 2:
                        founder.start();
                        break;
                    case 3:
                        delete.start();
                        break;
                    case 4:
                        System.exit(0);
                    default:
                        System.out.println("Invalid option. Please try again.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("An error occurred. Please try again.");
            }
        }
    }
}
