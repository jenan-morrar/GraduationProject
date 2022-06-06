package com.test.GraduationProject.recommendation_system;
public class RecommendedVenue implements Comparable<RecommendedVenue>{
    private long id;
    private long numberOfGuests;
    private long hasPark;
    private long numOfAvailableHalls;
    private double price;
    private long hasDrink;
    private long hasCake;
    private long hasCamera;
    private long hasScreens;
    private long hasCatering;
    private long hasDJ;
    private long hasAppetizers;
    private long hasLightingSystem;
    private long hasAirCondition;
    private long hasKidsPlayArea;
    private long hasFlowerDecoration;
    private long hasPhotoShooting;

    private double distanceWithInput;

    public RecommendedVenue(long id, long numberOfGuests, long hasPark, long numOfAvailableHalls, double price, long hasDrink, long hasCake, long hasCamera, long hasScreens, long hasCatering, long hasDJ, long hasAppetizers, long hasLightingSystem, long hasAirCondition, long hasKidsPlayArea, long hasFlowerDecoration, long hasPhotoShooting) {
        this.id = id;
        this.numberOfGuests = numberOfGuests;
        this.hasPark = hasPark;
        this.numOfAvailableHalls = numOfAvailableHalls;
        this.price = price;
        this.hasDrink = hasDrink;
        this.hasCake = hasCake;
        this.hasCamera = hasCamera;
        this.hasScreens = hasScreens;
        this.hasCatering = hasCatering;
        this.hasDJ = hasDJ;
        this.hasAppetizers = hasAppetizers;
        this.hasLightingSystem = hasLightingSystem;
        this.hasAirCondition = hasAirCondition;
        this.hasKidsPlayArea = hasKidsPlayArea;
        this.hasFlowerDecoration = hasFlowerDecoration;
        this.hasPhotoShooting = hasPhotoShooting;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getNumberOfGuests() {
        return numberOfGuests;
    }

    public void setNumberOfGuests(long numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }

    public long getHasPark() {
        return hasPark;
    }

    public void setHasPark(long hasPark) {
        this.hasPark = hasPark;
    }

    public long getNumOfAvailableHalls() {
        return numOfAvailableHalls;
    }

    public void setNumOfAvailableHalls(long numOfAvailableHalls) {
        this.numOfAvailableHalls = numOfAvailableHalls;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getHasDrink() {
        return hasDrink;
    }

    public void setHasDrink(long hasDrink) {
        this.hasDrink = hasDrink;
    }

    public long getHasCake() {
        return hasCake;
    }

    public void setHasCake(long hasCake) {
        this.hasCake = hasCake;
    }

    public long getHasCamera() {
        return hasCamera;
    }

    public void setHasCamera(long hasCamera) {
        this.hasCamera = hasCamera;
    }

    public long getHasScreens() {
        return hasScreens;
    }

    public void setHasScreens(long hasScreens) {
        this.hasScreens = hasScreens;
    }

    public long getHasCatering() {
        return hasCatering;
    }

    public void setHasCatering(long hasCatering) {
        this.hasCatering = hasCatering;
    }

    public long getHasDJ() {
        return hasDJ;
    }

    public void setHasDJ(long hasDJ) {
        this.hasDJ = hasDJ;
    }

    public long getHasAppetizers() {
        return hasAppetizers;
    }

    public void setHasAppetizers(long hasAppetizers) {
        this.hasAppetizers = hasAppetizers;
    }

    public long getHasLightingSystem() {
        return hasLightingSystem;
    }

    public void setHasLightingSystem(long hasLightingSystem) {
        this.hasLightingSystem = hasLightingSystem;
    }

    public long getHasAirCondition() {
        return hasAirCondition;
    }

    public void setHasAirCondition(long hasAirCondition) {
        this.hasAirCondition = hasAirCondition;
    }

    public long getHasKidsPlayArea() {
        return hasKidsPlayArea;
    }

    public void setHasKidsPlayArea(long hasKidsPlayArea) {
        this.hasKidsPlayArea = hasKidsPlayArea;
    }

    public long getHasFlowerDecoration() {
        return hasFlowerDecoration;
    }

    public void setHasFlowerDecoration(long hasFlowerDecoration) {
        this.hasFlowerDecoration = hasFlowerDecoration;
    }

    public long getHasPhotoShooting() {
        return hasPhotoShooting;
    }

    public void setHasPhotoShooting(long hasPhotoShooting) {
        this.hasPhotoShooting = hasPhotoShooting;
    }

    public double getDistanceWithInput() {
        return distanceWithInput;
    }

    public void setDistanceWithInput(double distanceWithInput) {
        this.distanceWithInput = distanceWithInput;
    }

    @Override
    public String toString() {
        return "Venue{" +
                "id=" + id +
                ", numberOfGuests=" + numberOfGuests +
                ", hasPark=" + hasPark +
                ", numOfAvailableHalls=" + numOfAvailableHalls +
                ", price=" + price +
                ", hasDrink=" + hasDrink +
                ", hasCake=" + hasCake +
                ", hasCamera=" + hasCamera +
                ", hasScreens=" + hasScreens +
                ", hasCatering=" + hasCatering +
                ", hasDJ=" + hasDJ +
                ", hasAppetizers=" + hasAppetizers +
                ", hasLightingSystem=" + hasLightingSystem +
                ", hasAirCondition=" + hasAirCondition +
                ", hasKidsPlayArea=" + hasKidsPlayArea +
                ", hasFlowerDecoration=" + hasFlowerDecoration +
                ", hasPhotoShooting=" + hasPhotoShooting +
                ", distanceWithInput=" + distanceWithInput +
                '}';
    }

    @Override
    public int compareTo(RecommendedVenue o) {
        return Double.compare(distanceWithInput, o.distanceWithInput);
    }
}
