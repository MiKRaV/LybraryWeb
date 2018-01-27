package by.htp.library.dao;

import java.util.ArrayList;

import by.htp.library.bean.User;
import by.htp.library.dao.exception.DAOException;
import by.htp.library.service.UserParameters;

public interface UserDAO {
	User logination(String login, String password) throws DAOException;
	void registration(User user) throws DAOException;
	boolean isUserExist(String login) throws DAOException;
	void changeUserData(User user, UserParameters data, String dataValue) throws DAOException;
	ArrayList<User> getAllUsersList() throws DAOException;
	void removeUser(String login) throws DAOException;
	User findUserByLogin(String login) throws DAOException;
	void blockUnlockUser(String login) throws DAOException;
}
