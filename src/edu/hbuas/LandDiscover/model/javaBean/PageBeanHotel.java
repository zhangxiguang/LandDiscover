package edu.hbuas.LandDiscover.model.javaBean;

public class PageBeanHotel {
    private int nowPage;
    private int nextPage;
    private int previousPage;
    private int firstPage;
    private int lastPage;
    private int allPages;
    private  int allCount;
    private int everyPageCount;
    private int onePage;
    private int twoPage;
    private int threePage;
    private int fourPage;
    private int fivePage;

    @Override
    public String toString() {
        return "PageBeanHotel{" +
                "nowPage=" + nowPage +
                ", nextPage=" + nextPage +
                ", previousPage=" + previousPage +
                ", firstPage=" + firstPage +
                ", lastPage=" + lastPage +
                ", allPages=" + allPages +
                ", allCount=" + allCount +
                ", everyPageCount=" + everyPageCount +
                ", onePage=" + onePage +
                ", twoPage=" + twoPage +
                ", threePage=" + threePage +
                ", fourPage=" + fourPage +
                ", fivePage=" + fivePage +
                '}';
    }

    public PageBeanHotel(){

    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getPreviousPage() {
        return previousPage;
    }

    public void setPreviousPage(int previousPage) {
        this.previousPage = previousPage;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getAllPages() {
        return allPages;
    }

    public void setAllPages(int allPages) {
        this.allPages = allPages;
    }

    public int getAllCount() {
        return allCount;
    }

    public void setAllCount(int allCount) {
        this.allCount = allCount;
    }

    public int getEveryPageCount() {
        return everyPageCount;
    }

    public void setEveryPageCount(int everyPageCount) {
        this.everyPageCount = everyPageCount;
    }

    public int getOnePage() {
        return onePage;
    }

    public void setOnePage(int onePage) {
        this.onePage = onePage;
    }

    public int getTwoPage() {
        return twoPage;
    }

    public void setTwoPage(int twoPage) {
        this.twoPage = twoPage;
    }

    public int getThreePage() {
        return threePage;
    }

    public void setThreePage(int threePage) {
        this.threePage = threePage;
    }

    public int getFourPage() {
        return fourPage;
    }

    public void setFourPage(int fourPage) {
        this.fourPage = fourPage;
    }

    public int getFivePage() {
        return fivePage;
    }

    public void setFivePage(int fivePage) {
        this.fivePage = fivePage;
    }
}
