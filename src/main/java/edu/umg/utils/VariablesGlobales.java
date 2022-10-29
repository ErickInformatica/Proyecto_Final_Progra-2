package edu.umg.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * Realiza la coneccion a la Base de Datos en Postgres
 */
public class VariablesGlobales {
    public static Connection conn;

    static {

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:postgresql://ec2-23-20-140-229.compute-1.amazonaws.com:5432/d7smic6hk5dvr3",
                    "qylmfquqbunbkt",
                    "2004da741fc3c17984c1d7e51857bc4944e7a7329164bb9ab21ad210ee44380d"
            );
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}
