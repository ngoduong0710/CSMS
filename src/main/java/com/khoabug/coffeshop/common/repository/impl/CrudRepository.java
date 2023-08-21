package com.khoabug.coffeshop.common.repository.impl;

import com.khoabug.coffeshop.common.paging.Pageable;
import com.khoabug.coffeshop.common.repository.Repository;
import com.khoabug.coffeshop.common.mapper.RowMapper;
import com.khoabug.coffeshop.common.repository.exception.NotCreatException;
import com.khoabug.coffeshop.common.repository.exception.NotFoundException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : DangKhoa
 * @since : 3/2/2023, Thu
 **/
public class CrudRepository implements Repository {

    private Connection connection = SqlConnector.getConnection();
    private static final Logger LOGGER = LogManager.getLogger(CrudRepository.class);

    @Override
    public <K> List<K> query(String sql, RowMapper<K> mapper, Object... parameters) {
        ArrayList<K> list = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            setParameter(statement, parameters);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(mapper.mapRow(resultSet));
            }
            return list;
        } catch (SQLException ex) {
            LOGGER.error(ex.getMessage(), ex.getCause());
            throw new NotFoundException();
        }
    }


    @Override
    public <K> List<K> query(Pageable pageable, RowMapper<K> mapper, String inputSql) {
        StringBuilder sql = new StringBuilder(inputSql);
        if (pageable != null && pageable.getSorter() == null) {
            sql.append(" ORDER BY (SELECT NULL) OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            return query(sql.toString(), mapper, pageable.getOffset(), pageable.getSize());
        } else if (pageable == null) {
            return query(sql.toString(), mapper);
        } else {
            sql.append(" ORDER BY ? OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ");
            return query(sql.toString(), mapper, pageable.getSorter().getProperty(),
                    pageable.getOffset(), pageable.getSize());
        }
    }


    @Override
    public void update(String sql, Object... parameters) {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            connection.setAutoCommit(false);
            setParameter(statement, parameters);
            statement.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            LOGGER.error(ex.getMessage(), ex.getCause());
            try {
                connection.rollback();
            } catch (SQLException exception) {
                LOGGER.error(exception.getMessage(), exception.getCause());
                throw new NotCreatException();
            }
        }
    }

    @Override
    public Long insert(String sql, Object... parameters) {
        try (PreparedStatement statement
                     = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            connection.setAutoCommit(false);
            setParameter(statement, parameters);
            statement.executeUpdate();
            connection.commit();
            return statement.getGeneratedKeys().getLong(1);
        } catch (SQLException e) {
            LOGGER.error(e.getMessage(), e.getCause());
            try {
                connection.rollback();
            } catch (SQLException exception) {
                LOGGER.error(exception.getMessage(), exception.getCause());
                throw new NotCreatException();
            }
        }
        return null;
    }

    @Override
    public int count(String sql, Object... parameters) {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            setParameter(statement, parameters);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                return resultSet.getInt(1);
        } catch (SQLException ex) {
            LOGGER.error(ex.getMessage(), ex.getCause());
        }
        return -1;
    }

    public String getFirstStringColumn(String sql, Object... parameters) {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            setParameter(statement, parameters);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                return resultSet.getString(1);
        } catch (SQLException ex) {
            LOGGER.error(ex.getMessage(), ex.getCause());
        }
        return null;
    }

    //TODO: change generic type
    private void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                } else if (parameter instanceof Double) {
                    statement.setDouble(index, (Double) parameter);
                } else if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                } else if (parameter instanceof Date) {
                    statement.setDate(index, (Date) parameter);
                } else if (parameter instanceof Boolean) {
                    statement.setBoolean(index, (Boolean) parameter);
                } else {
                    statement.setNull(index, Types.NULL);
                    LOGGER.error("parameter is null" + index);
                }
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage(), e.getCause());
        }
    }

    public static class SqlConnector {
        public static Connection getConnection() {
            try {
                Class.forName(SQLSERVER_DRIVER);
                return DriverManager.getConnection(MSSQL_URL);
            } catch (SQLException | ClassNotFoundException e) {
                LOGGER.error(e.getMessage(), e.getCause());
            }
            return null;
        }
    }

}


