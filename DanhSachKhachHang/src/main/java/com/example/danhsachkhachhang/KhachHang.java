package com.example.danhsachkhachhang;

public class KhachHang {
    private String name;
    private String gioitinh;
    private String address;
    private String url;

    public KhachHang(String name, String gioitinh, String address, String url) {
        this.name = name;
        this.gioitinh = gioitinh;
        this.address = address;
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
