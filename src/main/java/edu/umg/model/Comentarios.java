package edu.umg.model;

public class Comentarios {

    private int id;
    private String nombre;
    private String comentario;
    private int idNoticia;

    public Comentarios(int id, String nombre, String comentario, int idNoticia) {
        this.id = id;
        this.nombre = nombre;
        this.comentario = comentario;
        this.idNoticia = idNoticia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getIdNoticia() {
        return idNoticia;
    }

    public void setIdNoticia(int idNoticia) {
        this.idNoticia = idNoticia;
    }
}
