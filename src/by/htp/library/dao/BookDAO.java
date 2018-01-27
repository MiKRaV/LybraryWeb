package by.htp.library.dao;

import java.util.List;

import by.htp.library.bean.Author;
import by.htp.library.bean.Book;
import by.htp.library.dao.exception.DAOException;

public interface BookDAO {
	
	void addBook(Book book)throws DAOException;
	List<Book> searchBookByTitle(String title) throws DAOException;
	List<Book> getAllBooks() throws DAOException;
	boolean isAuthorExist(String name, String surname) throws DAOException;
	void removeBook(String title, List<Author> authors) throws DAOException;
	boolean isBookExist(String title, List<Author> authors) throws DAOException;

}
