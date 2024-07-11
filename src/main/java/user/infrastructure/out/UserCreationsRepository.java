package user.infrastructure.out;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import user.domain.entity.User;
import user.domain.service.CreateUserService;
import user.infrastructure.config.DatabaseConfig;

public class UserCreationsRepository implements CreateUserService {

    @Override
    public void createUser(User user) {
        String sql = "INSERT INTO user (username, email, password, role) VALUES (?, ?, ?, ?)";

        try (Connection connection = DatabaseConfig.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setInt(4, user.getRole());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        
}
