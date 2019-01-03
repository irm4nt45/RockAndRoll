package com.RockAndRoll.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.io.Serializable;

@Entity
public class BillingAddress implements Serializable {

    private static final long serialVersionUID = 2880549970338746206L;

    @Id
    @GeneratedValue
    private Integer billingAddressId;

    private String streetName;
    private String city;
    private String country;
    private String zipCode;

    @OneToOne
    private Customer customer;

    public Integer getBillingAddressId() {
        return billingAddressId;
    }

    public void setBillingAddressId(Integer billingAddressId) {
        this.billingAddressId = billingAddressId;
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
        return "BillingAddress{" +
                "billingAddressId=" + billingAddressId +
                ", streetName='" + streetName + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", customer=" + customer +
                '}';
    }
}
