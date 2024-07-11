package user.infrastructure.out;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import user.domain.service.DeleteUserService;
import user.infrastructure.config.DatabaseConfig;

public class UserDeletionsRepository implements DeleteUserService {

    @Override
    public boolean deleteUser(int id) {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM user WHERE id =?")) {
            
            statement.setInt(1, id);
            int row = statement.executeUpdate();
    
            return row != 0;
    
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
