package edu.umg.model;

public class Noticias {
    private int id;
    private String title;
    private String abstractMdl;
    private String byline;
    private String imbMult;
    private int conteo;

    public Noticias(int id,String title, int conteo, String imbMult) {
        this.id = id;
        this.title = title;
        this.conteo = conteo;
        this.imbMult = imbMult;
    }

    public Noticias(int id, String title, String abstractMdl, String byline, String imbMult) {
        this.id = id;
        this.title = title;
        this.abstractMdl = abstractMdl;
        this.byline = byline;
        this.imbMult = imbMult;
    }

    public int getConteo() {
        return conteo;
    }

    public void setConteo(int conteo) {
        this.conteo = conteo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbstractMdl() {
        return abstractMdl;
    }

    public void setAbstractMdl(String abstractMdl) {
        this.abstractMdl = abstractMdl;
    }

    public String getByline() {
        return byline;
    }

    public void setByline(String byline) {
        this.byline = byline;
    }

    public String getImbMult() {
        return imbMult;
    }

    public void setImbMult(String imbMult) {
        this.imbMult = imbMult;
    }
}
