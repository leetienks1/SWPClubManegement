package DAO;

import dal.ConnectDB;

public abstract class ConnectDbDao<T> implements DAO<T> {

    protected ConnectDB connectDB = ConnectDB.getInstance();
}
