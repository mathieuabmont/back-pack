function changeButtonLabel () {
  const label = document.querySelector('#new_ticket .ticket_photo label');
  label.innerHTML = "<i class='fa fa-upload' aria-hidden='true'></i>";
}

export {changeButtonLabel};
