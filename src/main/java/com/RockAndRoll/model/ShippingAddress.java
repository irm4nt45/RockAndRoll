package com.RockAndRoll.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.io.Serializable;

@Entity
public class ShippingAddress implements Serializable {

    private static final long serialVersionUID = -8827438560277042576L;

    @Id
    @GeneratedValue
    private Integer shippingAddressId;

    private String streetName;
    private String city;
    private String country;
    private String zipCode;

    @OneToOne
    private Customer customer;

    public Integer getShippingAddress() {
        return shippingAddressId;
    }

    public void setShippingAddress(Integer shippingAddressId) {
        this.shippingAddressId = shippingAddressId;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "ShippingAddress{" +
                "shippingAddressId=" + shippingAddressId +
                ", streetName='" + streetName + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", customer=" + customer +
                '}';
    }
}
