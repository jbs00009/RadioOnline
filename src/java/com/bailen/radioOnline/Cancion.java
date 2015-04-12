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
	public String getSongName() {
		return name;
	}
	public void setSongName(String songName) {
		this.name = songName;
	}
	public String getArtistName() {
		return artist_name;
	}
	public void setArtistName(String artistName) {
		this.artist_name = artistName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String photoUrl) {
		this.image = photoUrl;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getAudioUrl() {
		return audio;
	}
	public void setAudioUrl(String audioUrl) {
		this.audio = audioUrl;
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
            return   this.artist_name+this.id+this.name;
        }
	
}
