package user.com.test;

import user.domain.service.UserFullService;
import user.infrastructure.out.UserRepository;

public class Main {
    public static void main(String[] args) {
        UserFullService user = new UserRepository(null, null, null);
    }
}