// Sample data for playlists
const playlists = [
    { title: "Chill Vibes", imageUrl: "/images/profile-pic.jpg" },
    { title: "Workout Playlist", imageUrl: "/images/profile-pic.jpg" },
    { title: "Top Hits", imageUrl: "/images/profile-pic.jpg" },
    { title: "Mood Booster", imageUrl: "/images/profile-pic.jpg" },
    { title: "Classic Rock", imageUrl: "/images/profile-pic.jpg" },
    { title: "Summer Beats", imageUrl: "/images/profile-pic.jpg" },
    { title: "Jazz Classics", imageUrl: "/images/profile-pic.jpg" },
    { title: "Pop Essentials", imageUrl: "/images/profile-pic.jpg" },
    { title: "Indie Favorites", imageUrl: "/images/profile-pic.jpg" },
    { title: "Hip-Hop Mix", imageUrl: "/images/profile-pic.jpg" },
    { title: "Morning Motivation", imageUrl: "/images/profile-pic.jpg" },
    { title: "Evening Chill", imageUrl: "/images/profile-pic.jpg" },
    { title: "Dance Party", imageUrl: "/images/profile-pic.jpg" },
    { title: "Acoustic Collection", imageUrl: "/images/profile-pic.jpg" },
    { title: "Piano Relaxation", imageUrl: "/images/profile-pic.jpg" },
    { title: "Electronic Dreams", imageUrl: "/images/profile-pic.jpg" },
    { title: "Classic 80s", imageUrl: "/images/profile-pic.jpg" },
    { title: "Road Trip Anthems", imageUrl: "/images/profile-pic.jpg" },
    { title: "Feel Good Tunes", imageUrl: "/images/profile-pic.jpg" },
    { title: "Ultimate Throwback", imageUrl: "/images/profile-pic.jpg" },
    { title: "Winter Warmers", imageUrl: "/images/profile-pic.jpg" }
];

// Sample data for artists
const artists = [
    { name: "Artist 1", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 2", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 3", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 4", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 5", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 6", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 7", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 8", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 9", imageUrl: "/images/profile-pic.jpg" },
    { name: "Artist 10", imageUrl: "/images/profile-pic.jpg" }
];


function generatePlaylistCards() {
    const playlistDisplay = document.getElementById('playlistDisplay');
    
    playlists.forEach(playlist => {
        const card = document.createElement('div');
        card.className = 'playlist-card';

        const img = document.createElement('img');
        img.src = playlist.imageUrl;
        img.alt = playlist.title;

        const title = document.createElement('p');
        title.textContent = playlist.title;

        card.appendChild(img);
        card.appendChild(title);

        playlistDisplay.appendChild(card);
    });
}

function generateArtistCards() {
    const artistDisplay = document.getElementById('artistDisplay');
    
    artists.forEach(artist => {

        const card = document.createElement('div');
        card.className = 'artist-card';

        const img = document.createElement('img');
        img.src = artist.imageUrl;
        img.alt = artist.name;

        const name = document.createElement('p');
        name.textContent = artist.name;

        card.appendChild(img);
        card.appendChild(name);

        artistDisplay.appendChild(card);
    });
}

function enableHorizontalScroll() {
    const playlistDisplay = document.getElementById('playlistDisplay');
    const artistDisplay = document.getElementById('artistDisplay');

    playlistDisplay.addEventListener('wheel', function(event) {
        event.preventDefault(); 
        playlistDisplay.scrollLeft += event.deltaY; 
    });

    artistDisplay.addEventListener('wheel', function(event) {
        event.preventDefault(); 
        artistDisplay.scrollLeft += event.deltaY; 
    });
}

// Call the function to generate cards and enable horizontal scrolling on page load
document.addEventListener('DOMContentLoaded', function() {
    generatePlaylistCards(); // Generate playlist cards
    generateArtistCards(); // Generate artist cards
    enableHorizontalScroll(); // Enable horizontal scroll for both sections
});
function toggleDropdown() {
    const dropdownMenu = document.querySelector('.dropdown-menu');
    dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
}
