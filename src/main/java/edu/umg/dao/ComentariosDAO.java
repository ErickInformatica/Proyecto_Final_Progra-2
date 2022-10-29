package edu.umg.dao;

import edu.umg.model.Comentarios;
import edu.umg.model.Noticias;
import edu.umg.utils.VariablesGlobales;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ComentariosDAO {
    /**
     * @param idnoticion Id de la noticia que se desea obtener sus comentarios
     * @return List<comentarios>
     *     Retorna los comentarios de la noticias indicada.
     */
    public List<Comentarios> getComentarioByID(int idnoticion){
        List<Comentarios> comentarios = new ArrayList<>();

        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String sql = "select * from comentarios where idnoticia = " + idnoticion;
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){

                Comentarios comentario = new Comentarios(rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("comentario"),
                        rs.getInt("idnoticia"));
                comentarios.add(comentario);

            }
        } catch (SQLException throwables) {
            System.out.println( "getById: " + throwables.getMessage() );
            throwables.printStackTrace();
        }
        return comentarios;
    }

}
