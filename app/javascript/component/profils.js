function tabs () {
  const button_trip = document.getElementById('trip_btn');
  button_trip.addEventListener("click", (event) => {
  button_trip.ClassList.add('appear');
});
}

export {tabs};
