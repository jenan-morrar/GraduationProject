const APIController = (function() {
    
    const clientId = '2116750daa4b440ca5c383eb57b6c9ff';
    const clientSecret = 'd8e2f49c5a784279b658864142c984a3';

    const _getToken = async () => {
        
        const result = await fetch('https://accounts.spotify.com/api/token', {
            method: 'POST',
            headers: {
                'Content-Type' : 'application/x-www-form-urlencoded', 
                'Authorization' : 'Basic ' + btoa(clientId + ':' + clientSecret)
            },
            body: 'grant_type=client_credentials'
        });

        const data = await result.json();
        return data.access_token;
    }

    const _getPlaylistItems = async (token, playlistId) => {
        const limit = 100;
        
        const result = await fetch(`https://api.spotify.com/v1/playlists/${playlistId}/tracks?limit=${limit}`, {
            method: 'GET',
            headers: { 'Authorization' : 'Bearer ' + token}
        });

        const data = await result.json();
        return data.items;
    }

    return {
        getToken() {
            return _getToken();
        },
        getPlaylistItems(token){
            return _getPlaylistItems(token,"35qQs2gse8dp6JhZoJNK5F");
        }
    }
})();

const UIController = (function() {
    //object to hold references to html selectors
    const DOMElements = {
        hfToken: '#hidden_token',
        divSonglist: '.songs-list-container',
    }

    //public methods
    return {

        //method to get input fields
        inputField() {
            return {
                tracks: document.querySelector(DOMElements.divSonglist),
            }
        },

        // need method to create the song detail
        createTrack(img, title, artist, previewUrl) {

            const divSongsList = document.querySelector(DOMElements.divSonglist);
            // any time user clicks a new song, we need to clear out the song detail div
    		
              let html = `<div class="song-card" style="background-image:url(${img});">`;
              if(!document.getElementById("no-user")){
				html += ` <div style="display: flex; flex-direction: row-reverse;background-color:rgb(0,0,0,0.5);">
                          	<input type="checkbox" name="${title}-${artist}" class="song-checkbox">
                          </div> `;
			  }else{
				html += ` <div style="display: flex; flex-direction: row-reverse;background-color:rgb(0,0,0,0.5);">
                          	<input type="checkbox" name="${title}-${artist}" class="song-checkbox" style="visibility:hidden;">
                          </div> `;
			}                          
              html += `	<div class="song-card-data">
                            <div class="song-info">
                                <div class="song-labels" >
                                     <label class="song-info-label">${title}</label>
                                     <label class="song-info-label">${artist}</label>
                            	</div> 
	                            </div>
	                            <audio controls>
	                                  <source src="${previewUrl}" type="audio/ogg">
	                            </audio>
                            </div>
                        </div> `;
            divSongsList.insertAdjacentHTML('beforeend', html)
        },
        storeToken(value) {
            document.querySelector(DOMElements.hfToken).value = value;
        },

        getStoredToken() {
            return {
                token: document.querySelector(DOMElements.hfToken).value
            }
        }
    }
})();

const APPController = (function(UICtrl, APICtrl) {
     const loadPlaylistItems = async () => {
        //get the token
        const token = await APICtrl.getToken();           
        //store the token onto the page
        UICtrl.storeToken(token);
        const tracks = await APICtrl.getPlaylistItems(token);
        //populate our genres select element
        //TODO: get back here
         tracks.forEach(el => UICtrl.createTrack(el.track.album.images[2].url, el.track.name, el.track.artists[0].name, el.track.preview_url));
    }

    return {
        init() {
            loadPlaylistItems();
        }
    }
})(UIController, APIController);

// will need to call a method to load the genres on page load
APPController.init();
