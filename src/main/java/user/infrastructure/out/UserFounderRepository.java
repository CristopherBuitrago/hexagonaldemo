package user.infrastructure.out;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.domain.entity.User;
import user.domain.service.FindUserService;
import user.infrastructure.config.DatabaseConfig;

public class UserFounderRepository implements FindUserService{

    @Override
    public User findUserById(int id) {
        String sql = "SELECT id, username, email, role FROM user WHERE id = ?";
        User user = null;

        try (Connection connection = DatabaseConfig.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setRole(resultSet.getInt("role"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

}
