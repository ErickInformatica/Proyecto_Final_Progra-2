package edu.umg.dao;

import edu.umg.model.Noticias;
import edu.umg.utils.VariablesGlobales;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NoticiasDAO {

    /**
     * @return List<noticias>
     *     Lista de todas las noticias dentro de la Base de Datos
     */
    public List<Noticias> getAllNoticias(){
        List<Noticias> noticias = new ArrayList<>();

        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String sql = "select * from noticias";
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){

                Noticias noticia = new Noticias(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("abstract"),
                        rs.getString("byline"),
                        rs.getString("imbmult"));
                noticias.add(noticia);

            }
        } catch (SQLException throwables) {
            System.out.println( "getAllDB: " + throwables.getMessage() );
            throwables.printStackTrace();
        }
        return noticias;
    }

    /**
     * @param id Noticia a obtener datos
     * @return List<noticias>
     *     retorna los datos de la noticias indicada.
     */
    public List<Noticias> getNoticiaByID(int id){
        List<Noticias> noticias1 = new ArrayList<>();

        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String sql = "select * from noticias where id = " + id;
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){

                Noticias noticia1 = new Noticias(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("abstract"),
                        rs.getString("byline"),
                        rs.getString("imbmult"));
                noticias1.add(noticia1);

            }
        } catch (SQLException throwables) {
            System.out.println( "getById: " + throwables.getMessage() );
            throwables.printStackTrace();
        }
        return noticias1;
    }


    /**
     * @return List<noticias>
     *     Lista con las 3 noticias mas comentadas.
     */
    public List<Noticias> noticiasTop(){
        List<Noticias> noticias = new ArrayList<>();

        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String sql = "select n.id ,n.title,n.imbmult,(select count(*) from comentarios c where c.idnoticia = n.id) as cantidad from noticias n order by (select count(*) from comentarios c where c.idnoticia = n.id) desc FETCH FIRST 3 ROW ONLY";
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){

                Noticias noticia = new Noticias(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getInt("cantidad"),
                        rs.getString("imbmult"));
                noticias.add(noticia);

            }
        } catch (SQLException throwables) {
            System.out.println( "noticiasTop: " + throwables.getMessage() );
            throwables.printStackTrace();
        }
        return noticias;
    }

    /**
     * @return int numConteo
     *          Este contiene el numero de noticias creadas en la Base de Datos
     */
    public int conteoNoticias(){
        int numConteo = 0;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String sql = "select count(*) as conteo  from noticias;";
            ResultSet rs = statement.executeQuery(sql);

            while( rs.next() ){
                numConteo = rs.getInt("conteo");
            }
        } catch (SQLException throwables) {
            System.out.println( "conteoNoticias: " + throwables.getMessage() );
            throwables.printStackTrace();
        }
        return numConteo;
    }





}
