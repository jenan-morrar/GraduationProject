package com.test.GraduationProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.Images;
import com.test.GraduationProject.repositories.ImageRepository;

@Service
public class ImagesService {

	private ImageRepository imageRepository;
	
	public ImagesService(ImageRepository imageRepository) {
		this.imageRepository = imageRepository;
	}
	
	// returns all the images
	public List<Images> allImages() {
		return imageRepository.findAll();
	}

	// creates a image
	public Images createImage(Images venue) {
		return imageRepository.save(venue);
	}

	// retrieves a image
	public Images findImage(Long id) {
		Optional<Images> optionalService = imageRepository.findById(id);
		if (optionalService.isPresent()) {
			return optionalService.get();
		} else {
			return null;
		}
	}
	
    // edit a image 
    public Images updateImage(Long id, String name) {
    	Images image = findImage(id);
    	image.setId(id);
    	image.setImage(name);
    	return imageRepository.save(image);
    }
    
    // delete a image 
    public void deleteImage(Long id) {
    	imageRepository.deleteById(id);
    }
}
