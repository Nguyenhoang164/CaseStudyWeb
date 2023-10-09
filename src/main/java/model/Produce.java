package model;

public class Produce {
    private int id;
    private String name;
    private String houseProduce;
    private String prize;
    private String status;
    private String urlImg;
    private String note;

    public Produce(int id, String name, String houseProduce, String prize, String status, String urlImg, String note) {
        this.id = id;
        this.name = name;
        this.houseProduce = houseProduce;
        this.prize = prize;
        this.status = status;
        this.urlImg = urlImg;
        this.note = note;
    }
    public Produce(String name, String houseProduce, String prize, String status, String urlImg, String note) {
        this.name = name;
        this.houseProduce = houseProduce;
        this.prize = prize;
        this.status = status;
        this.urlImg = urlImg;
        this.note = note;
    }
    public Produce(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHouseProduce() {
        return houseProduce;
    }

    public void setHouseProduce(String houseProduce) {
        this.houseProduce = houseProduce;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
