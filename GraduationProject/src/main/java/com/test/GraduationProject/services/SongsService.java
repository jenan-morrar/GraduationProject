package com.test.GraduationProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.UserSongs;
import com.test.GraduationProject.repositories.SongsRepository;

@Service
public class SongsService {

	private SongsRepository songsRepository;
	
	public SongsService(SongsRepository songsRepository) {
		this.songsRepository = songsRepository;
	}
	
	// returns all the userSongs
	public List<UserSongs> allUserSongs() {
		return songsRepository.findAll();
	}

	// creates a userSongs
	public UserSongs createUserSongs(UserSongs userSongs) {
		return songsRepository.save(userSongs);
	}

	// retrieves a userSongs
	public UserSongs findUserSongs(Long id) {
		Optional<UserSongs> optionalService = songsRepository.findById(id);
		if (optionalService.isPresent()) {
			return optionalService.get();
		} else {
			return null;
		}
	}
	
    // edit a userSongs 
    public UserSongs updateUserSongs(Long id, String songs,User user) {
    	UserSongs userSong = findUserSongs(id);
    	userSong.setId(id);
    	userSong.setSongs(songs);
    	userSong.setId(user.getId());
    	return songsRepository.save(userSong);
    }
    
    // delete a userSongs 
    public void deleteUserSongs(Long id) {
    	songsRepository.deleteById(id);
    }

}
