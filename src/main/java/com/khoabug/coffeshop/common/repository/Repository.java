package com.khoabug.coffeshop.common.repository;

import com.khoabug.coffeshop.common.mapper.RowMapper;
import com.khoabug.coffeshop.common.paging.Pageable;

import java.util.List;

/**
 * @author : DangKhoa
 * @since : 3/2/2023, Thu
 **/
public interface Repository {

    String MSSQL_URL = """
            jdbc:sqlserver://localhost:1433;
            database=CSMS;
            user=sa;
            password=0912217817;
            encrypt=false;
            trustServerCertificate=false;
            loginTimeout=30;""";
    String SQLSERVER_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    <K> List<K> query(String sql, RowMapper<K> mapper, Object... parameters);

    <T> List<T> query(Pageable pageable, RowMapper<T> mapper, String inputSql);

    void update(String sql, Object... parameters);

    Long insert(String sql, Object... parameters);

    int count(String sql, Object... parameters);
}
