package com.khoabug.coffeshop.common.mapper;

import java.sql.ResultSet;

/**
 * @author : DangKhoa
 * @since : 3/2/2023, Thu
 **/
public interface RowMapper<K> {
    K mapRow(ResultSet resultSet);
}
