package by.htp.library.dao.helper;

public class DAOBookHelper {
	
	public static final String ID_BOOK = "id_book";
	public static final String STATUS_BOOK = "status_book";
	public static final String GENRE = "genre";
	public static final String TITLE = "title";
	
	public static final String AUTHOR_NAME = "name";
	public static final String AUTHOR_SURNAME = "surname";
	
	public static final String SELECT_ALL_BOOKS = "SELECT * FROM books";
	public static final String SELECT_ALL_BOOKS_WITH_AUTHORS = "SELECT id_book, status_book, genre, title, name, surname FROM books" + 
			" JOIN books_authors USING(id_book)" + 
			" JOIN authors USING(id_author)" + 
			" ORDER BY id_book";
	public static final String SELECT_BOOKS_BY_TITLE = "SELECT * FROM books WHERE title=?";
	public static final String SELECT_BOOK_WITH_AUTHORS = "SELECT id_book, status_book, genre, title, name, surname FROM" + 
			" (SELECT * FROM books WHERE id_book=?) b" + 
			" JOIN books_authors USING(id_book)" + 
			" JOIN authors USING(id_author)" + 
			" ORDER BY id_book";
	public static final String SELECT_ALL_AUTHORS = "SELECT * FROM authors";
	public static final String SELECT_AUTHORS_BY_ID_BOOK = "SELECT id_book, id_author, name, surname FROM" + 
			" (SELECT * FROM books_authors WHERE id_book=?) ba" + 
			" JOIN authors USING(id_author)";
	
}
