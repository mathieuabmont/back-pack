function tabs () {
  const button_trip = document.getElementById('trip_btn');
  const button_friend = document.getElementById('friend_btn');
  const card_trip = document.getElementById('trip_card');
  const card_friend = document.getElementById('friend_card');
  if (button_trip) {
    button_trip.addEventListener("click", (event) => {
      card_friend.classList.add('remove');
      card_trip.classList.remove('remove');
    });
  }
  if (button_friend) {
    button_friend.addEventListener("click", (event)=> {
      card_friend.classList.remove('remove');
      card_trip.classList.add('remove');
    });
  }
}

export {tabs};
