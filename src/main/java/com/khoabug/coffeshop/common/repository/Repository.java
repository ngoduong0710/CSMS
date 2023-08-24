package com.khoabug.coffeshop.common.repository;

import com.khoabug.coffeshop.common.mapper.RowMapper;
import com.khoabug.coffeshop.common.paging.Pageable;

import java.util.List;

/**
 * @author : DangKhoa
 * @since : 3/2/2023, Thu
 **/
public interface Repository {

    String MSSQL_URL =
            """
                    jdbc:sqlserver://localhost:1433;
                    database=CSMS;
                    user=sa;
                    password=0912217817;
                    encrypt=false;
                    trustServerCertificate=false;
                    loginTimeout=30;""";
    String SQLSERVER_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    String H2_URL =
            "jdbc:h2:file:~/ldata/fakebook-master/src/main/resources/data/test";

    String H2_DRIVER = "org.h2.Driver";

    String H2_USER = "sa";
    String H2_PASS = "";


    <K> List<K> query(String sql, RowMapper<K> mapper, Object... parameters);

    <T> List<T> query(String inputSql, RowMapper<T> mapper, Pageable pageable, Object... parameters);

    void update(String sql, Object... parameters);

    Long insert(String sql, Object... parameters);

    int count(String sql, Object... parameters);
}
