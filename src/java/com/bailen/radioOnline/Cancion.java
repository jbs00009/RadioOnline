package com.bailen.radioOnline;

import org.codehaus.jackson.annotate.JsonProperty;

public class Cancion {

	int id;
	String name;
        int duration;
        String artist_id;
	String artist_name;
        String artist_idstr;
        String album_name;
        String album_id;
        String license_ccurl;
        int position;
        String releasedate;
        String album_image;
        String audio;
        String audiodownload;
        String prourl;
        String shorturl;
        String shareurl;
	String image;
	
	
	int rating;
	boolean fav;
	
	public Cancion(){}

    public Cancion(@JsonProperty("id")int id,@JsonProperty("name") String name,@JsonProperty("duration") int duration,@JsonProperty("artist_id") String artist_id,@JsonProperty("artist_name") String artist_name,@JsonProperty("artist_idstr") String artist_idstr,@JsonProperty("album_name") String album_name,@JsonProperty("album_id") String album_id,@JsonProperty("license_ccurl") String license_ccurl,@JsonProperty("position") int position,@JsonProperty("releasedate") String releasedate,@JsonProperty("album_image") String album_image,@JsonProperty("audio") String audio,@JsonProperty("audiodownload") String audiodownload,@JsonProperty("prourl") String prourl,@JsonProperty("shorturl") String shorturl,@JsonProperty("shareurl") String shareurl,@JsonProperty("image") String image) {
        this.id = id;
        this.name = name;
        this.duration = duration;
        this.artist_id = artist_id;
        this.artist_name = artist_name;
        this.artist_idstr = artist_idstr;
        this.album_name = album_name;
        this.album_id = album_id;
        this.license_ccurl = license_ccurl;
        this.position = position;
        this.releasedate = releasedate;
        this.album_image = album_image;
        this.audio = audio;
        this.audiodownload = audiodownload;
        this.prourl = prourl;
        this.shorturl = shorturl;
        this.shareurl = shareurl;
        this.image = image;
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

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getArtist_id() {
        return artist_id;
    }

    public void setArtist_id(String artist_id) {
        this.artist_id = artist_id;
    }

    public String getArtist_name() {
        return artist_name;
    }

    public void setArtist_name(String artist_name) {
        this.artist_name = artist_name;
    }

    public String getArtist_idstr() {
        return artist_idstr;
    }

    public void setArtist_idstr(String artist_idstr) {
        this.artist_idstr = artist_idstr;
    }

    public String getAlbum_name() {
        return album_name;
    }

    public void setAlbum_name(String album_name) {
        this.album_name = album_name;
    }

    public String getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(String album_id) {
        this.album_id = album_id;
    }

    public String getLicense_ccurl() {
        return license_ccurl;
    }

    public void setLicense_ccurl(String license_ccurl) {
        this.license_ccurl = license_ccurl;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public String getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }

    public String getAlbum_image() {
        return album_image;
    }

    public void setAlbum_image(String album_image) {
        this.album_image = album_image;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getAudiodownload() {
        return audiodownload;
    }

    public void setAudiodownload(String audiodownload) {
        this.audiodownload = audiodownload;
    }

    public String getProurl() {
        return prourl;
    }

    public void setProurl(String prourl) {
        this.prourl = prourl;
    }

    public String getShorturl() {
        return shorturl;
    }

    public void setShorturl(String shorturl) {
        this.shorturl = shorturl;
    }

    public String getShareurl() {
        return shareurl;
    }

    public void setShareurl(String shareurl) {
        this.shareurl = shareurl;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean isFav() {
        return fav;
    }

    public void setFav(boolean fav) {
        this.fav = fav;
    }
        
       
        
	
        @Override
	public String toString(){
            return   this.artist_name+this.id+this.name+"    "+this.audio;
        }
	
}
