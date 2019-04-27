package edu.hbuas.LandDiscover.model.javaBean;

public class commentPage {
    private int fristpage;
    private int frontpage;
    private int laterpage;
    private int thispage;
    private int allpage;
    private int allcount;
    private int everypagecount;

    @Override
    public String toString() {
        return "commentPage{" +
                "fristpage=" + fristpage +
                ", frontpage=" + frontpage +
                ", laterpage=" + laterpage +
                ", thispage=" + thispage +
                ", allpage=" + allpage +
                ", allcount=" + allcount +
                ", everypagecount=" + everypagecount +
                '}';
    }

    public int getFristpage() {
        return fristpage;
    }

    public void setFristpage(int fristpage) {
        this.fristpage = fristpage;
    }

    public int getFrontpage() {
        return frontpage;
    }

    public void setFrontpage(int frontpage) {
        this.frontpage = frontpage;
    }

    public int getLaterpage() {
        return laterpage;
    }

    public void setLaterpage(int laterpage) {
        this.laterpage = laterpage;
    }

    public int getThispage() {
        return thispage;
    }

    public void setThispage(int thispage) {
        this.thispage = thispage;
    }

    public int getAllpage() {
        return allpage;
    }

    public void setAllpage(int allpage) {
        this.allpage = allpage;
    }

    public int getAllcount() {
        return allcount;
    }

    public void setAllcount(int allcount) {
        this.allcount = allcount;
    }

    public int getEverypagecount() {
        return everypagecount;
    }

    public void setEverypagecount(int everypagecount) {
        this.everypagecount = everypagecount;
    }
}
